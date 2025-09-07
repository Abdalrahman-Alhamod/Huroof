import 'dart:async';
import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart'; // keep for Player + playback waveform
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/app/data/model/syllable.dart';
import 'package:huroof/app/modules/letterDetails/controllers/letter_details_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

// NEW
import 'package:record/record.dart';

import '../../../../../core/functions/show_custom_snackbar.dart';
import '../../../../../core/utils/logger.dart';
import 'validation_dialog.dart';

class SyllableRecordStep extends StatefulWidget {
  final Syllable syllable;

  const SyllableRecordStep({super.key, required this.syllable});

  @override
  State<SyllableRecordStep> createState() => _SyllableRecordStepState();
}

class _SyllableRecordStepState extends State<SyllableRecordStep> {
  late final PlayerController _playerController;

  // NEW — record package
  final AudioRecorder _wavRecorder = AudioRecorder();
  StreamSubscription<Amplitude>? _ampSub;

  late final StreamSubscription<void> _playerCompletionSubscription;

  bool _isRecording = false;
  bool _isRecordingCompleted = false;
  bool _isProcessing = false;
  final Rx<String?> _recordedVoicePath = Rx(null);

  // live meter state
  double _db = -160; // dBFS

  @override
  void initState() {
    super.initState();
    _playerController = PlayerController();
    _playerCompletionSubscription = _playerController.onPlayerStateChanged
        .listen((_) => setState(() {}));

    ever(_recordedVoicePath, (path) {
      Get.find<LetterDetailsController>().recordedVoicePath = path;
    });
  }

  Future<bool> _requestPermissions() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
    }
    if (!status.isGranted && mounted) {
      showCustomSnackbar(
        title: 'تسجيل الحرف',
        message: 'تم رفض إذن تسجيل الصوت',
        type: SnackbarType.error,
      );
    }
    return status.isGranted;
  }

  Future<void> _startRecording() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      // Permissions
      final ok = await _requestPermissions();
      if (!ok) return;

      // If we had a previous recording, clear it
      if (_isRecordingCompleted) _deleteRecording();

      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/recording_${const Uuid().v4()}.wav';
      _recordedVoicePath.value = path;

      // Configure WAV (PCM16) with good defaults
      final cfg = RecordConfig(
        encoder: AudioEncoder.wav, // PCM16 WAV
        sampleRate: 48000, // 48 kHz (fallback handled by plugin)
        numChannels: 1, // mono voice
        bitRate: 256000, // ignored for PCM16 but safe to set
      );

      // Start recording
      await _wavRecorder.start(cfg, path: path);

      // Subscribe to amplitude for a lightweight level meter
      unawaited(_ampSub?.cancel());
      _ampSub = _wavRecorder
          .onAmplitudeChanged(const Duration(milliseconds: 80))
          .listen((amp) {
            setState(() => _db = amp.current); // dBFS (approx)
          });

      setState(() {
        _isRecording = true;
        _isRecordingCompleted = false;
      });
    } catch (e) {
      logger.print(
        'Error While Starting WAV Recording $e',
        title: 'Recording Widget',
        color: PrintColor.red,
      );
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _stopRecording() async {
    try {
      // Stop and get final path
      final path = await _wavRecorder.stop();
      unawaited(_ampSub?.cancel());
      _ampSub = null;

      if (path != null) {
        _recordedVoicePath.value = path;
        logger.print(
          'Recorded WAV Path $path',
          title: 'Recording Widget',
          color: PrintColor.cyan,
        );

        // prepare playback once (AudioFileWaveforms works for WAV too)
        unawaited(
          _playerController.preparePlayer(
            path: path,
            shouldExtractWaveform: true,
            noOfSamples: 300,
            volume: 1.0,
          ),
        );
      }
    } catch (e) {
      logger.print(
        'Error While Stopping WAV Recording $e',
        title: 'Recording Widget',
        color: PrintColor.red,
      );
    } finally {
      setState(() {
        _isRecording = false;
        _isRecordingCompleted = true;
      });
    }
  }

  void _deleteRecording() async {
    try {
      unawaited(_ampSub?.cancel());
      _ampSub = null;
      await _wavRecorder.cancel(); // ensures temp file is cleaned if any

      if (_recordedVoicePath.value != null) {
        final file = File(_recordedVoicePath.value!);
        if (file.existsSync()) file.deleteSync();
      }
      if (_playerController.playerState.isPlaying) {
        unawaited(_playerController.stopPlayer());
      }
    } catch (e) {
      logger.print(
        'Error While Deleting Recording $e',
        title: 'Recording Widget',
        color: PrintColor.red,
      );
    } finally {
      setState(() {
        _isRecordingCompleted = false;
        _recordedVoicePath.value = null;
      });
    }
  }

  Future<void> _togglePlayback() async {
    if (!_isRecordingCompleted || _recordedVoicePath.value == null) return;
    try {
      _playerController.playerState.isPlaying
          ? await _playerController.pausePlayer()
          : await _playerController.startPlayer();
      await _playerController.setFinishMode(finishMode: FinishMode.pause);
    } catch (e) {
      logger.print(
        'Error While Playing Or Pausing Recording $e',
        title: 'Recording Widget',
        color: PrintColor.red,
      );
    }
  }

  Future<void> _toggleMicButton() async {
    if (_isRecording) {
      await _stopRecording();
    } else if (_playerController.playerState.isPlaying ||
        _isRecordingCompleted) {
      await _togglePlayback();
    } else {
      await _startRecording();
    }
  }

  Future<void> _submitForValidation() async {
    Get.find<LetterDetailsController>().submit(widget.syllable, (
      submitResponse,
    ) async {
      await showValidationDialog(
        context: context,
        result: submitResponse.result!,
        isSuccess: submitResponse.result! > 60,
        onRetry: () => _deleteRecording(),
        onSuccess: () => Get.find<LetterDetailsController>().nextStep(),
      );
    });
  }

  @override
  void dispose() {
    _ampSub?.cancel();
    _wavRecorder.dispose();
    _playerController.dispose();
    _playerCompletionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final level = _db.isFinite ? _db : -160;
    // normalize -60..0 dB -> 0..1
    final norm = (level.clamp(-60, 0) + 60) / 60;

    return SingleChildScrollView(
      child: Column(
        children: [
          /// Header
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.record_voice_over,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        LocaleKeys.syllableRecordingTitle.tr,
                        style: AppTextStyles.s14_regular.primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  widget.syllable.recordingHint!,
                  style: AppTextStyles.s16_medium.darkGreyColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // Main card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    widget.syllable.text!,
                    style: AppTextStyles.s68_bold.primaryColor.copyWith(
                      fontFamily: AppFonts.Amiri,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  AvatarGlow(
                    glowColor: AppColors.primary,
                    glowShape: BoxShape.circle,
                    animate: !_isRecording && !_isRecordingCompleted,
                    curve: Curves.fastOutSlowIn,
                    glowCount: !_isRecording && !_isRecordingCompleted ? 2 : 0,
                    glowRadiusFactor: 0.3,
                    child: GestureDetector(
                      onTap: _toggleMicButton,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _isRecording
                                  ? AppColors.error.withValues(alpha: 0.2)
                                  : _playerController.playerState.isPlaying
                                  ? AppColors.grey.withValues(alpha: 0.2)
                                  : _isRecordingCompleted
                                  ? AppColors.success.withValues(alpha: 0.2)
                                  : AppColors.primary.withValues(alpha: 0.2),
                        ),
                        child: Icon(
                          _isRecording
                              ? Icons.stop
                              : _playerController.playerState.isPlaying
                              ? Icons.pause
                              : _isRecordingCompleted
                              ? Icons.play_arrow
                              : Icons.mic,
                          size: 40.sp,
                          color:
                              _isRecording
                                  ? AppColors.error
                                  : _playerController.playerState.isPlaying
                                  ? AppColors.grey
                                  : _isRecordingCompleted
                                  ? AppColors.success
                                  : AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  // Small live level bar while recording (since full live waveform is not available with `record`)
                  SizedBox(height: 16.h),
                  if (_isRecording) _LevelMeter(norm: norm),
                ],
              ),
            ),
          ),

          SizedBox(height: 24.h),

          /// Bottom: Recorded Waveform (playback)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child:
                  _isRecording
                      ? Center(
                        child: Text(
                          'Recording WAV • ${(_db.isFinite ? level.toStringAsFixed(0) : '-∞')} dB',
                          style: AppTextStyles.s14_medium.darkGreyColor,
                        ),
                      )
                      : _isRecordingCompleted
                      ? AudioFileWaveforms(
                        playerController: _playerController,
                        size: Size(double.infinity, 60.h),
                        playerWaveStyle: const PlayerWaveStyle(
                          fixedWaveColor: AppColors.grey,
                          liveWaveColor: AppColors.primary,
                          showSeekLine: false,
                          scaleFactor: 300.0,
                        ),
                        waveformType: WaveformType.long,
                        decoration: const BoxDecoration(color: Colors.white),
                      )
                      : Center(
                        child: Text(
                          LocaleKeys.syllableNoRecordingYet.tr,
                          style: AppTextStyles.s14_medium.darkGreyColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
            ),
          ),

          SizedBox(height: 12.h),

          /// Submit / Delete
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _isRecordingCompleted ? _deleteRecording : null,
                icon: const Icon(Icons.delete),
                label: Text(LocaleKeys.syllableDeleteButton.tr),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 14.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              ElevatedButton.icon(
                onPressed: _isRecordingCompleted ? _submitForValidation : null,
                icon: const Icon(Icons.check_circle),
                label: Text(LocaleKeys.syllableSubmitButton.tr),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 14.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LevelMeter extends StatelessWidget {
  final double norm; // 0..1
  const _LevelMeter({required this.norm});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(999),
      ),
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: norm.clamp(0.02, 1.0),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}

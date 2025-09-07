import 'dart:async';
import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/app/data/model/syllable.dart';
import 'package:huroof/app/modules/letterDetails/controllers/letter_details_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

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
  late final RecorderController _recorderController;
  late final StreamSubscription<void> _playerCompletionSubscription;

  bool _isRecording = false;
  bool _isRecordingCompleted = false;
  bool _isProcessing = false;
  final Rx<String?> _recordedVoicePath = Rx(null);

  @override
  void initState() {
    super.initState();
    _playerController = PlayerController();
    _recorderController =
        RecorderController() // ANDROID — pick modern, high quality encoder & container
          ..androidEncoder = AndroidEncoder.aac
          ..androidOutputFormat = AndroidOutputFormat.mpeg4
          // iOS — high quality AAC
          ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
          // Common tuning
          ..sampleRate =
              48000 // 48 kHz (fallback to 44100 if device can’t)
          ..bitRate =
              256000 // ~256 kbps
              ;
    _playerCompletionSubscription = _playerController.onPlayerStateChanged
        .listen((_) {
          setState(() {});
        });
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
    // Prevent Multiple Clicks
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      // Check Permessions
      final ok = await _requestPermissions();
      if (!ok) return;

      // If we had a previous recording, clear it
      if (_isRecordingCompleted) _deleteRecording();

      final dir = await getApplicationDocumentsDirectory();
      _recordedVoicePath.value =
          '${dir.path}/recording_${const Uuid().v4()}.mp3';

      await _recorderController.record(path: _recordedVoicePath.value);
    } catch (error) {
      logger.print(
        'Error While Starting Recording $error',
        title: 'Recording Widget',
        color: PrintColor.red,
      );
    } finally {
      setState(() {
        if (_recorderController.hasPermission) {
          _isRecording = true;
        }
      });
      _isProcessing = false;
    }
  }

  Future<void> _stopRecording() async {
    try {
      _recorderController.reset();

      _recordedVoicePath.value = await _recorderController.stop(false);
      logger.print(
        'Recorded Path ${_recordedVoicePath.value}',
        title: 'Recording Widget',
        color: PrintColor.cyan,
      );
      // prepare playback once
      if (_recordedVoicePath.value != null) {
        unawaited(
          _playerController.preparePlayer(
            path: _recordedVoicePath.value!,
            // waveform extraction has no effect on audio fidelity,
            // but chooses the visual resolution for your chart:
            shouldExtractWaveform: true,
            noOfSamples: 300, // higher resolution waveform
            volume: 1.0,
          ),
        );
      }
    } catch (error) {
      logger.print(
        'Error While Stopping Recording $error',
        title: 'Recording Widget',
        color: PrintColor.red,
      );
    } finally {
      setState(() {
        if (_recorderController.hasPermission) {
          _isRecording = false;
          _isRecordingCompleted = true;
        }
      });
    }
  }

  void _deleteRecording() async {
    try {
      if (_recordedVoicePath.value != null) {
        final file = File(_recordedVoicePath.value!);
        if (file.existsSync()) file.deleteSync();
      }
      // stop playback if playing
      if (_playerController.playerState.isPlaying) {
        unawaited(_playerController.stopPlayer());
      }
    } catch (error) {
      logger.print(
        'Error While Deleting Recording $error',
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
    } catch (error) {
      logger.print(
        'Error While Playing Or Pausing Recording $error',
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
        isSuccess: submitResponse.result! > 0.6,
        onRetry: () {
          _deleteRecording();
        },
        onSuccess: () {
          Get.find<LetterDetailsController>().nextStep();
        },
      );
    });
  }

  @override
  void dispose() {
    _recorderController.dispose();
    _playerController.dispose();
    _playerCompletionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ),

          SizedBox(height: 24.h),

          /// Bottom: Recorded Waveform
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
                      ? AudioWaveforms(
                        size: Size(double.infinity, 60.h),
                        recorderController: _recorderController,
                        waveStyle: const WaveStyle(
                          waveColor: AppColors.primary,
                          extendWaveform: true,
                          showMiddleLine: false,
                          spacing: 6.0,
                          scaleFactor: 50,
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
                        ),
                      ),
            ),
          ),

          SizedBox(height: 12.h),

          /// Submit Button
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

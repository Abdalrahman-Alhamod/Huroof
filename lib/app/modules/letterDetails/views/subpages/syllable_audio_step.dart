import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huroof/app/data/model/syllable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

class SyllableAudioStep extends StatefulWidget {
  final Syllable syllable;

  const SyllableAudioStep({super.key, required this.syllable});

  @override
  State<SyllableAudioStep> createState() => _SyllableAudioStepState();
}

class _SyllableAudioStepState extends State<SyllableAudioStep> {
  late final PlayerController _playerController;
  String? _localPath;

  @override
  void initState() {
    super.initState();
    _playerController = PlayerController();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    final audioPath = AppAudio.ba; // Replace with: widget.letter.mainAudio!;
    final tempDir = await getTemporaryDirectory();
    final fileName = audioPath.split('/').last;
    final filePath = '${tempDir.path}/$fileName';

    final file = File(filePath);
    if (!await file.exists()) {
      final bytes = await rootBundle.load(audioPath);
      await file.writeAsBytes(bytes.buffer.asUint8List());
    }

    _localPath = file.path;

    await _playerController.preparePlayer(
      path: _localPath!,
      shouldExtractWaveform: true,
      noOfSamples: 100,
      volume: 1.0,
    );

    await _playerController.setFinishMode(finishMode: FinishMode.pause);

    _playerController.onPlayerStateChanged.listen((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _handleSpeakerPressed() async {
    if (_playerController.playerState.isPlaying) {
      await _playerController.pausePlayer();
    }
    await _playerController.seekTo(0);
    await _playerController.startPlayer();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.volume_up_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.mainAudioTitle.tr,
                      style: AppTextStyles.s14_regular.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.mainAudioSubtitle.tr,
                style: AppTextStyles.s16_medium.darkGreyColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        /// Card: Letter + Pronunciation + Speaker Button
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
                  style: AppTextStyles.s68_bold.primaryColor,
                ),
                SizedBox(height: 24.h),

                /// ✅ Modern Speaker Button with InkWell for feedback
                InkWell(
                  onTap: _handleSpeakerPressed,
                  borderRadius: BorderRadius.circular(100.r),
                  splashColor: AppColors.primary.withValues(alpha: 0.2),
                  highlightColor: AppColors.primary.withValues(alpha: 0.1),
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(alpha: 0.15),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.volume_up_rounded,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 24.h),

        /// Waveform Card
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
                _localPath == null
                    ? const Center(child: CircularProgressIndicator())
                    : AudioFileWaveforms(
                      playerController: _playerController,
                      size: Size(double.infinity, 80.h),
                      playerWaveStyle: const PlayerWaveStyle(
                        fixedWaveColor: AppColors.grey,
                        liveWaveColor: AppColors.primary,
                        showSeekLine: false,
                        scaleFactor: 100.0,
                      ),
                      waveformType: WaveformType.long,
                      decoration: const BoxDecoration(color: AppColors.white),
                    ),
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huroof/app/data/model/syllable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

// ✅ Optional: pass a network URL. If null, we fall back to the old asset flow.
class SyllableAudioStep extends StatefulWidget {
  final Syllable syllable;

  const SyllableAudioStep({super.key, required this.syllable});

  @override
  State<SyllableAudioStep> createState() => _SyllableAudioStepState();
}

class _SyllableAudioStepState extends State<SyllableAudioStep> {
  late final PlayerController _playerController;
  String? _localPath; // stays the same; now points to the temp file if network
  String? _tempFilePath; // so we can delete the downloaded file on dispose
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _playerController = PlayerController();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _localPath = null;
    });

    try {
      if (widget.syllable.audio != null &&
          widget.syllable.audio!.trim().isNotEmpty) {
        // ===== Network path (borrowed from VoicePlayerWidget) =====
        final downloadedPath = await _downloadToTemp(
          widget.syllable.audio!.trim(),
        );
        _tempFilePath = downloadedPath;
        _localPath = downloadedPath;

        await _playerController.preparePlayer(
          path: downloadedPath,
          shouldExtractWaveform: true,
          noOfSamples: 100,
          volume: 1.0,
        );
      }
      //  else {
      //   // ===== Asset fallback (original logic kept intact) =====
      //   final audioPath = AppAudio.ba; // TODO: replace with: widget.syllable.mainAudio!;
      //   final tempDir = await getTemporaryDirectory();
      //   final fileName = audioPath.split('/').last;
      //   final filePath = '${tempDir.path}/$fileName';

      //   final file = File(filePath);
      //   if (!await file.exists()) {
      //     final bytes = await rootBundle.load(audioPath);
      //     await file.writeAsBytes(bytes.buffer.asUint8List());
      //   }

      //   _localPath = file.path;

      //   await _playerController.preparePlayer(
      //     path: _localPath!,
      //     shouldExtractWaveform: true,
      //     noOfSamples: 100,
      //     volume: 1.0,
      //   );
      // }

      unawaited(_playerController.setFinishMode(finishMode: FinishMode.pause));

      // Keep UI reactive (waveform & button state if needed)
      _playerController.onPlayerStateChanged.listen((_) {
        if (mounted) setState(() {});
      });
    } catch (e) {
      debugPrint('🚨 Failed to initialize player: $e');
      if (mounted) setState(() => _hasError = true);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<String> _downloadToTemp(String url) async {
    final dio = Dio();
    final tempDir = await getTemporaryDirectory();

    final ext = _extractFileExtension(url);
    final filename = 'temp_audio_${DateTime.now().millisecondsSinceEpoch}.$ext';
    final filePath = '${tempDir.path}/$filename';

    final response = await dio.download(
      url,
      filePath,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode != 200) {
      throw Exception('❌ Download failed with status ${response.statusCode}');
    }

    return filePath;
  }

  String _extractFileExtension(String url) {
    try {
      final uri = Uri.parse(url);
      final segments = uri.pathSegments;
      if (segments.isEmpty) return 'mp3';
      final last = segments.last;
      return last.contains('.') ? last.split('.').last : 'mp3';
    } catch (_) {
      return 'mp3';
    }
  }

  Future<void> _handleSpeakerPressed() async {
    try {
      if (_playerController.playerState.isPlaying) {
        await _playerController.pausePlayer();
      }
      await _playerController.seekTo(0);
      await _playerController.startPlayer();
    } catch (e) {
      debugPrint('🚨 Playback error: $e');
    }
  }

  @override
  void dispose() {
    _playerController.dispose();
    _deleteTempFile();
    super.dispose();
  }

  Future<void> _deleteTempFile() async {
    if (_tempFilePath != null) {
      final file = File(_tempFilePath!);
      if (await file.exists()) {
        await file.delete();
        debugPrint('🗑️ Temp audio file deleted.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Header — unchanged
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

          /// Card: Letter + Speaker — unchanged
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

          /// Waveform Card — unchanged container/layout; just plugs into new logic
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
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _hasError
                      ? const Center(child: Text('Failed to load audio.'))
                      : (_localPath == null
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
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                          )),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/utils/imports_manager.dart';

class VoicePlayerWidget extends StatefulWidget {
  final String assetPath; // example: 'assets/audio/ba.mp3'

  const VoicePlayerWidget({super.key, required this.assetPath});

  @override
  State<VoicePlayerWidget> createState() => _VoicePlayerWidgetState();
}

class _VoicePlayerWidgetState extends State<VoicePlayerWidget> {
  late final PlayerController _playerController;
  String? _localPath;

  @override
  void initState() {
    super.initState();
    _playerController = PlayerController();
    _loadAssetAndPrepare();
  }

  Future<void> _loadAssetAndPrepare() async {
    final tempDir = await getTemporaryDirectory();
    final fileName = widget.assetPath.split('/').last;
    final filePath = '${tempDir.path}/$fileName';

    final file = File(filePath);
    if (!await file.exists()) {
      final bytes = await rootBundle.load(widget.assetPath);
      await file.writeAsBytes(bytes.buffer.asUint8List());
    }

    _localPath = file.path;

    await _playerController.preparePlayer(
      path: _localPath!,
      shouldExtractWaveform: true,
      noOfSamples: 100,
      volume: 1.0,
    );

    _playerController.onPlayerStateChanged.listen((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _togglePlayback() async {
    if (_playerController.playerState.isPlaying) {
      await _playerController.pausePlayer();
    } else {
      await _playerController.startPlayer();
      await _playerController.setFinishMode(finishMode: FinishMode.pause);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_localPath == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(8.r),
      child: Row(
        children: [
          Expanded(
            child: AudioFileWaveforms(
              playerController: _playerController,
              size: Size(double.infinity, 80.h),
              playerWaveStyle: const PlayerWaveStyle(
                fixedWaveColor: AppColors.grey,
                liveWaveColor: AppColors.primary,
                showSeekLine: false,
                scaleFactor: 100.0,
              ),
              waveformType: WaveformType.long,
              decoration: const BoxDecoration(color: AppColors.lightGrey),
            ),
          ),
          IconButton(
            onPressed: _togglePlayback,
            icon: Icon(
              _playerController.playerState.isPlaying
                  ? Icons.pause_outlined
                  : Icons.play_circle_outlined,
              size: 40.sp,
              color:
                  _playerController.playerState.isPlaying
                      ? AppColors.grey
                      : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

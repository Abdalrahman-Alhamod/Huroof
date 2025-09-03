import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePlayer extends StatefulWidget {
  const CustomYoutubePlayer({
    super.key,
    required this.url,
    this.aspectRatio = 16 / 9,
  });
  final String url;
  final double aspectRatio;
  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  YoutubePlayerController? _controller;
  String? _videoId;

  @override
  void initState() {
    super.initState();
    _videoId =
        (widget.url.isEmpty)
            ? null
            : YoutubePlayerController.convertUrlToId(widget.url);

    if (_videoId != null && _videoId!.isNotEmpty) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: _videoId!,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          strictRelatedVideos: true,
          playsInline: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      aspectRatio: widget.aspectRatio,
      controller: _controller!,
      builder: (context, player) {
        return player;
      },
    );
  }
}

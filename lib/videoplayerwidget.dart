import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPLayerWidget extends StatefulWidget {
  final String videoUrl;
  VideoPLayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPLayerWidget> createState() => _VideoPLayerWidgetState();
}

class _VideoPLayerWidgetState extends State<VideoPLayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayer = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testing_video_player/videoplayerwidget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: VideoPLayerWidget(
                videoUrl:
                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")),
      ),
    );
  }
}

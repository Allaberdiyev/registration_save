import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class FlutterInfo extends StatefulWidget {
  const FlutterInfo({super.key});

  @override
  State<FlutterInfo> createState() => _FlutterInfoState();
}

class _FlutterInfoState extends State<FlutterInfo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {

        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onLesson1Pressed() {}

  void _onLesson2Pressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Video Player'),
            ),
            body: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : const CircularProgressIndicator(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Info'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTO_V4HjbEnDrneINTURZMCrs9O9vIF_aZ6g&s",
              scale: 0.1,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Nomi: flutter',
            style: TextStyle(
              fontSize: 26.0,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Tavsif: Flutter courses',
            style: TextStyle(
              fontSize: 26.0,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Darslar',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          TextButton(
            onPressed: _onLesson1Pressed,
            child: const Text(
              "1-dars",
              style: TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(height: 8.0),
          TextButton(
            onPressed: _onLesson2Pressed,
            child: const Text(
              "2-dars",
              style: TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Narxi:  \$250',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
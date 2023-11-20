// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_final_fields, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video_Update extends StatefulWidget {
  // const Video_Update({super.key});

  @override
  State<Video_Update> createState() => _Video_UpdateState();
}

class _Video_UpdateState extends State<Video_Update> {
  late YoutubePlayerController _controller;

  String? url = YoutubePlayer.convertUrlToId(
      'https://www.youtube.com/watch?v=GQyWIur03aw');

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=1Fk0K8La7qc';

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: 20 / 9,
              onReady: () {
                print('The Video ID : $url');
              },
            ),
          ),
        ],
      ),
    );
  }
}

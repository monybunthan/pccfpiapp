// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video_Page extends StatefulWidget {
  // const Video_Page({super.key});

  @override
  State<Video_Page> createState() => _Video_PageState();
}

class _Video_PageState extends State<Video_Page> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=1Fk0K8La7qc';

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: true,
        ));
  }

  @override
  void deactivate() {
    controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
          ),
          builder: (context, player) => SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text('PlayList')),
              body: SafeArea(
                child: ListView(children: [
                  player,
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    child: Text('Next Video'),
                    onPressed: () {
                      const url = 'https://www.youtube.com/watch?v=8D6zHVv87EQ';
                      controller.load(YoutubePlayer.convertUrlToId(url)!);
                      // if (controller.value.isPlaying) {
                      //   controller.pause();
                      // } else {
                      //   controller.play();
                      // }
                    },
                  )
                ]),
              ),
            ),
          ),
        ),
      );
}

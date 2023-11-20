// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main_video/test_video.dart';

class Video_Play extends StatelessWidget {
  // const Video_Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Play'),
              onPressed: () {
                // final url =
                //     'https://www.youtube.com/watch?v=0TUpwZyVdnw&t=329s';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeVideo(
                          'https://www.youtube.com/watch?v=yP_Ai0cHL5k'),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: camel_case_types, unused_field, prefer_const_constructors, unused_element

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';

class Live_Stream extends StatefulWidget {
  const Live_Stream({super.key});

  @override
  State<Live_Stream> createState() => _Live_StreamState();
}

String url =
    'https://drive.google.com/uc?export=view&id=1JeVhEUHgjyoMOtWIL6gOv4qeWqLqUx2X';
bool _isPlaying = true;

class _Live_StreamState extends State<Live_Stream> {
  final VlcPlayerController _vlcPlayerController = VlcPlayerController.network(
    url,
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
    autoInitialize: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VlcPlayer(
                controller: _vlcPlayerController,
                aspectRatio: 16 / 9,
                placeholder: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         if (_isPlaying) {
              //           setState(() {
              //             _isPlaying = false;
              //           });
              //           _vlcPlayerController.pause();
              //         } else {
              //           setState(() {
              //             _isPlaying = true;
              //           });
              //           _vlcPlayerController.play();
              //         }
              //       },
              //       child: Icon(
              //         _isPlaying ? Icons.pause : Icons.play_arrow,
              //       ),
              //     )
              //   ],
              // )
              Row(children: [
                Text(
                  'LIVEz',
                  style: TextStyle(
                    color: red,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

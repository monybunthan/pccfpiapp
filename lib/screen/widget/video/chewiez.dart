// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:video_player/video_player.dart';

class Video_Z extends StatelessWidget {
  // const Video_Z({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Players')),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(
        padding: EdgeInsets.all(10),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          VideoPlayerView(
              url:
                  'https://firebasestorage.googleapis.com/v0/b/test-95ab3.appspot.com/o/2022-10-18%2019-38-53.mkv?alt=media&token=06221914-e9a4-46c9-a205-cc4917919137',
              dataSourceType: DataSourceType.network),
        ],
      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.url,
    required this.dataSourceType,
  });

  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      allowFullScreen: true,
      zoomAndPan: true,
      autoPlay: false,
      looping: true,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.dataSourceType.name.toUpperCase(),
        ),
        const Divider(),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        )
      ],
    );
  }
}

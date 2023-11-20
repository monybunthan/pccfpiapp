// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, unused_element, avoid_print, unnecessary_cast, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../theme/themes.dart';
import 'test_video.dart';

class Video_Main extends StatefulWidget {
  // const Video_Main({super.key});

  @override
  State<Video_Main> createState() => _Video_MainState();
}

class _Video_MainState extends State<Video_Main> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            'វីដេអូបង្រៀន',
            style: TextStyle(fontFamily: 'DG', color: color_rgb),
          ),
          leading: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.transparent, width: 0.8),
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: color_rgb,
              )),
        ),
        body: FirestoreListView(
          query: FirebaseFirestore.instance
              .collection('video')
              .orderBy('id', descending: false),
          loadingBuilder: (_) => CircularProgressIndicator(),
          itemBuilder: (context, snapshot) {
            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
            // Timestamp t = data['data'] as Timestamp;

            return SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 7, right: 7, top: 6),
                color: Colors.white,
                child: SafeArea(
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        color_rgb, //                   <--- border color
                                    width: 1,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data["thum"],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: null /* add child content here */,
                              ),
                              ListTile(
                                title: Text(
                                  "មេរៀន " + data["title"].toString(),
                                  style: TextStyle(
                                      fontFamily: 'DG',
                                      color: color_blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  data["min"].toString(),
                                  style: TextStyle(
                                      fontFamily: 'DG',
                                      color: red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeVideo(data['url'].toString()),
                                ));
                          },
                        ),

                        //
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

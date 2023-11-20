// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, duplicate_ignore, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pccfpi/screen/widget/page_view/news/news_object.dart';

import '../../theme/themes.dart';

class News_Page extends StatefulWidget {
  // const News_Page({super.key});

  @override
  State<News_Page> createState() => _News_PageState();
}

class _News_PageState extends State<News_Page> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDz = [];

  Future getDocIdz() async {
    await FirebaseFirestore.instance
        .collection('news')
        .orderBy('id', descending: true)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              // print(document.reference.id);
              docIDz.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: getDocIdz(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docIDz.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 7, right: 7, top: 6),
                      color: Colors.white,
                      child: SafeArea(
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: color_rgb, width: 0.8),
                              borderRadius:
                                  // ignore: prefer_const_constructors
                                  BorderRadius.all(Radius.circular(2))),
                          color: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          child: NewsPage(
                            documentIdz: docIDz[index],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}

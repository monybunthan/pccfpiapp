// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/page_view/news/news_page.dart';
import 'package:pccfpi/screen/widget/page_view/page_three.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main_page.dart';
import 'package:flutter/material.dart';

import 'news/news_/news_update.dart';

class Page_Two extends StatefulWidget {
  @override
  State<Page_Two> createState() => _Page_TwoState();
}

class _Page_TwoState extends State<Page_Two> {
  final db = FirebaseFirestore.instance;
  // final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDz = [];

  Future getDocIdz() async {
    await FirebaseFirestore.instance
        .collection('news')
        .orderBy('id', descending: false)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference.id);
              docIDz.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: News_Time(),
    );
  }
}

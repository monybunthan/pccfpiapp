// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

import '../job/job_ho.dart';
import '../job/job_page.dart';

class PageNews extends StatefulWidget {
  @override
  State<PageNews> createState() => _Page_TwoState();
}

class _Page_TwoState extends State<PageNews> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "PCCFPI",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: color_blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "' ",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mobile",
                  style: TextStyle(
                    color: color_blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Job_Page(),
              Job_Page(),
              Job_ho(),
            ],
          ),
        ),
      ),
    );
  }
}

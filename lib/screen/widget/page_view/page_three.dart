// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main_page.dart';
import 'package:flutter/material.dart';

import 'job/job_ho.dart';
import 'job/job_page.dart';

class Page_Three extends StatefulWidget {
  @override
  State<Page_Three> createState() => _Page_TwoState();
}

class _Page_TwoState extends State<Page_Three> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

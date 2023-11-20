// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccfpi/animation/fade_animation.dart';

import '../theme/themes.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage(
      {super.key,
      required this.year1,
      required this.year2,
      required this.year3,
      required this.year4});

  final String year1;
  final String year2;
  final String year3;
  final String year4;

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'ថ្នាក់សិក្សា',
          style: GoogleFonts.battambang(
            textStyle:
                TextStyle(color: color_blue, fontWeight: FontWeight.w600),
          ),
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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage("assets/images/1024.png"),
              fit: BoxFit.contain),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 15, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                intervalStart: 0.1,
                child: Text(
                  'ថ្នាក់អាហារូបករណ៍',
                  style: GoogleFonts.koulen(
                    textStyle: TextStyle(color: color_blue, fontSize: 20),
                  ),
                ),
              ),
              FadeAnimation(
                intervalStart: 0.2,
                child: Text(
                  '     - វេនព្រឹក​ ចាប់ពីម៉ោង ០៨:៣០​ -> ១១:៣០\n',
                  style: GoogleFonts.battambang(
                    textStyle: TextStyle(
                        color: Color.fromARGB(160, 0, 0, 0), fontSize: 17),
                  ),
                ),
              ),
              FadeAnimation(
                intervalStart: 0.1,
                child: Text(
                  'ថ្នាក់បង់ថ្លៃ',
                  style: GoogleFonts.koulen(
                    textStyle: TextStyle(color: color_blue, fontSize: 20),
                  ),
                ),
              ),
              FadeAnimation(
                intervalStart: 0.2,
                child: Text(
                  '     - វេនល្ងាច​ ចាប់ពីម៉ោង ០៥:៣០​ -> ០៨:៣០',
                  style: GoogleFonts.battambang(
                    textStyle: TextStyle(
                        color: Color.fromARGB(160, 0, 0, 0), fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              FadeAnimation(
                intervalStart: 0.2,
                child: Table(
                  border: TableBorder.all(color: color_blue, width: 1),
                  columnWidths: const {
                    0: FlexColumnWidth(2.5),
                    1: FlexColumnWidth(2.5),
                    2: FlexColumnWidth(2.5),
                  },
                  children: [
                    TableRow(children: [
                      Text(
                        'ឆ្នាំទី០១',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        widget.year1 + '\$',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        'គ្រប់ជំនាញ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'ឆ្នាំទី០២',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        widget.year2 + '\$',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        'គ្រប់ជំនាញ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'ឆ្នាំទី០៣',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        widget.year3 + '\$',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        'គ្រប់ជំនាញ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'ឆ្នាំទី០៤',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        widget.year4 + '\$',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                      Text(
                        'គ្រប់ជំនាញ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Color.fromARGB(160, 0, 0, 0),
                              fontSize: 19),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FadeAnimation(
                intervalStart: 0.2,
                child: Text(
                  'សូមទំនាក់ទំនងមកផ្ទាល់វិទ្យាស្ថានដើម្បីទទួលបានព័ត៍មានលម្អិត​។',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.battambang(
                    textStyle: TextStyle(color: color_blue, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

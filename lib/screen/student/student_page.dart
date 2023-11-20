// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccfpi/animation/fade_animation.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StudentPage extends StatefulWidget {
  final nameKH;
  final nameEng;
  final gender;
  final id;
  final skill;
  const StudentPage(
      {super.key, this.nameKH, this.nameEng, this.gender, this.id, this.skill});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

final user = FirebaseAuth.instance.currentUser!;

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ទំព័រសិស្ស',
            style: GoogleFonts.koulen(
              textStyle: TextStyle(
                // fontSize: 11,
                color: color_rgb,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: color_rgb,
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: SizedBox(
                    height: 130,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              color_rgb.withOpacity(0.5),
                              color_rgb.withOpacity(0.6),
                              color_rgb.withOpacity(0.7),
                              color_rgb.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 31,
                                  backgroundImage: NetworkImage(user.photoURL!),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.nameKH ?? 'null',
                                      style: GoogleFonts.koulen(
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 1.5),
                                      decoration: BoxDecoration(
                                        color: Colors.red[600],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1.5)),
                                      ),
                                      child: Text(
                                        'NO. ${widget.id}',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'ភេទ៖​ ',
                                          style: GoogleFonts.dangrek(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          widget.gender ?? 'null',
                                          style: GoogleFonts.koulen(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          ' ជំនាញ៖​ ',
                                          style: GoogleFonts.dangrek(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          widget.skill,
                                          style: GoogleFonts.koulen(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
              indicatorColor: color_rgb,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'សម័យពិន្ទុសិក្សា',
                        style: GoogleFonts.koulen(
                          textStyle: TextStyle(
                            color: color_rgb,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/settings-sliders.svg',
                        width: 12,
                        color: color_rgb,
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ព័ត៌មានផ្ទាល់ខ្លូន',
                        style: GoogleFonts.koulen(
                          textStyle: TextStyle(
                            color: color_rgb,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/user.svg',
                        width: 12,
                        color: color_rgb,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('student')
                    .where('email', isEqualTo: user.email)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                    children: snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        double op1 = data['op1'] / 100;
                        double op2 = data['op2'] / 100;
                        double op3 = data['op3'] / 100;
                        double op4 = data['op4'] / 100;
                        double op5 = data['op5'] / 100;
                        int total = data['op1'] +
                            data['op2'] +
                            data['op3'] +
                            data['op4'] +
                            data['op5'];

                        return Column(
                          children: [
                            SizedBox(
                              // height: MediaQuery.of(context).size.width,
                              height: 600,
                              child: TabBarView(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'តារាងពិន្ទុក',
                                            style: GoogleFonts.koulen(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                color: color_rgb,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data['ob1'] ?? 'NULL',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ពិន្ទុក : ' +
                                                    data['op1'].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1500,
                                        lineHeight: 40,
                                        percent: op1,
                                        progressColor: color_rgb,
                                        backgroundColor: Colors.grey[200],
                                        center: Text(
                                          data['op1'].toString() + '%',
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data['ob2'] ?? 'NULL',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ពិន្ទុក : ' +
                                                    data['op2'].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1500,
                                        lineHeight: 40,
                                        percent: op2,
                                        progressColor: color_rgb,
                                        backgroundColor: Colors.grey[200],
                                        center: Text(
                                          data['op2'].toString() + '%',
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data['ob3'] ?? 'NULL',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ពិន្ទុក : ' +
                                                    data['op3'].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1500,
                                        lineHeight: 40,
                                        percent: op3,
                                        progressColor: color_rgb,
                                        backgroundColor: Colors.grey[200],
                                        center: Text(
                                          data['op3'].toString() + '%',
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data['ob4'] ?? 'NULL',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ពិន្ទុក : ' +
                                                    data['op4'].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1500,
                                        lineHeight: 40,
                                        percent: op4,
                                        progressColor: color_rgb,
                                        backgroundColor: Colors.grey[200],
                                        center: Text(
                                          data['op4'].toString() + '%',
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data['ob5'] ?? 'NULL',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ពិន្ទុក : ' +
                                                    data['op5'].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1500,
                                        lineHeight: 40,
                                        percent: op5,
                                        progressColor: color_rgb,
                                        backgroundColor: Colors.grey[200],
                                        center: Text(
                                          data['op5'].toString() + '%',
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ពិន្ទុកបូកសម្រុប: ' +
                                                    total.toString(),
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    color: color_rgb,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ////Viewpage2
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                FadeAnimation(
                                                  intervalStart: 0.2,
                                                  child: Container(
                                                    height: 120,
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      // border: Border.all(
                                                      //   color:
                                                      //       color_rgb, //                   <--- border color
                                                      //   width: 1,
                                                      // ),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/PCCFPI.png'),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    child: null,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data['nameKH'] ?? 'NULL',
                                              style: GoogleFonts.koulen(
                                                textStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: color_rgb,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data['nameEng'] ?? 'NULL',
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: color_rgb,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 10, top: 15, bottom: 15),
                                          margin: const EdgeInsets.only(
                                            top: 13,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2)),
                                              border:
                                                  Border.all(color: color_rgb)),
                                          child: Row(
                                            children: [
                                              Text(
                                                'ជំនាញ៖​ ',
                                                style: GoogleFonts.dangrek(
                                                  textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: color_rgb,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                data['skill'],
                                                style: GoogleFonts.koulen(
                                                  textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: color_rgb,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 10, top: 15, bottom: 15),
                                          margin: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2)),
                                              border:
                                                  Border.all(color: color_rgb)),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'ជំនាន់ទី៖​ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['gen'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'ឆ្នាំទី៖​ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['year'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'វេន៖​ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['shift'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 10, top: 5, bottom: 5),
                                          margin: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2)),
                                              border:
                                                  Border.all(color: color_rgb)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'អត្ថលេខ៖ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['id'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'ភេទ៖​ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['gender'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'ថ្ងៃខែឆ្នាំកំណើត៖​ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['born'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '​ស្នាក់នៅសាលា៖ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['stand'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'លេខទូរស័ព្ទ៖ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['phone'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '​អ៊ី​ម៉េ​ល៖ ',
                                                    style: GoogleFonts.dangrek(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color_rgb,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['email'],
                                                    style: GoogleFonts.koulen(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

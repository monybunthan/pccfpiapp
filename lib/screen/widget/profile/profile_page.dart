// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, unused_import, sort_child_properties_last, prefer_const_literals_to_create_immutables, duplicate_ignore, deprecated_member_use, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/about_me/other/detail_me.dart';
import 'package:pccfpi/screen/widget/page_view/page_four.dart';
import 'package:provider/provider.dart';

import '../../../animation/fade_animation.dart';
import '../../../model/google_sign_in.dart';
import '../../admin/admin__page.dart';
import '../../student/student_page.dart';
import '../teacher/panel/teacher_pages.dart';
import '../theme/themes.dart';
import '../../../main_page.dart';
import '../drawer/my_drawer.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_PageState createState() => _Profile_PageState();
}

final user = FirebaseAuth.instance.currentUser!;

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    // final top = coverHeight - profileHeight / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'គណនីរបស់អ្នក',
          style: TextStyle(color: color_rgb, fontFamily: 'DG'),
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
        // actions: [
        //   GestureDetector(
        //     onTap: () async {
        //       // showModalBottomSheet(
        //       //   context: context,
        //       //   builder: (BuildContext context) {
        //       //     return Container(
        //       //       height: 200,
        //       //       child: Padding(
        //       //         padding: const EdgeInsets.all(15.0),
        //       //         child: Column(
        //       //             mainAxisAlignment: MainAxisAlignment.center,
        //       //             children: [
        //       //               Text(
        //       //                 'តើអ្នកពិតជាចង់ចាក់ចេញមែនទេ?',
        //       //                 style: TextStyle(
        //       //                     color: color_rgb,
        //       //                     fontFamily: 'DG',
        //       //                     fontSize: 17.5),
        //       //               ),
        //       //               SizedBox(
        //       //                 height: 10,
        //       //               ),
        //       //               OutlinedButton(
        //       //                 style: OutlinedButton.styleFrom(
        //       //                   foregroundColor: Colors.white,
        //       //                   backgroundColor: color_rgb,
        //       //                   minimumSize: Size(double.infinity, 56),
        //       //                   shadowColor: Colors.blue[800],
        //       //                   side: BorderSide(color: color_rgb, width: 0.3),
        //       //                   shape: const BeveledRectangleBorder(
        //       //                       borderRadius:
        //       //                           BorderRadius.all(Radius.circular(0.3))),
        //       //                   elevation: 0,
        //       //                 ),
        //       //                 onPressed: () async {
        //       //                   FirebaseFirestore.instance
        //       //                       .collection('allstuff')
        //       //                       .where('email', isEqualTo: user.email!)
        //       //                       .get()
        //       //                       .then(
        //       //                     (QuerySnapshot querySnapshot) {
        //       //                       for (var doc in querySnapshot.docs) {
        //       //                         if (doc["role"] == 'admin') {
        //       //                           Navigator.push(
        //       //                             context,
        //       //                             MaterialPageRoute(
        //       //                                 builder: (context) =>
        //       //                                     AdminPage()),
        //       //                           );
        //       //                         } else if (doc["role"] == 'teacher') {
        //       //                           Navigator.push(
        //       //                             context,
        //       //                             MaterialPageRoute(
        //       //                                 builder: (context) =>
        //       //                                     TeacherPanel()),
        //       //                           );
        //       //                         } else if (doc["role"] == 'student') {
        //       //                           Navigator.push(
        //       //                             context,
        //       //                             MaterialPageRoute(
        //       //                                 builder: (context) =>
        //       //                                     StudentPage()),
        //       //                           );
        //       //                         } else {
        //       //                           Navigator.push(
        //       //                             context,
        //       //                             MaterialPageRoute(
        //       //                                 builder: (context) =>
        //       //                                     Profile_Page()),
        //       //                           );
        //       //                         }
        //       //                       }
        //       //                     },
        //       //                   );
        //       //                   return;
        //       //                 },
        //       //                 child: Text(
        //       //                   'យល់ព្រម',
        //       //                   style: TextStyle(
        //       //                       fontFamily: 'DG',
        //       //                       fontSize: 15,
        //       //                       color: Colors.white),
        //       //                 ),
        //       //               ),
        //       //               //

        //       //               SizedBox(
        //       //                 height: 8,
        //       //               ),
        //       //               OutlinedButton(
        //       //                 style: OutlinedButton.styleFrom(
        //       //                   primary: color_rgb,
        //       //                   // onSurface: Colors.white,
        //       //                   minimumSize: Size(double.infinity, 56),
        //       //                   shadowColor: Colors.blue[800],
        //       //                   side: BorderSide(color: color_rgb, width: 0.3),
        //       //                   shape: const BeveledRectangleBorder(
        //       //                       borderRadius:
        //       //                           BorderRadius.all(Radius.circular(0.3))),
        //       //                   elevation: 0,
        //       //                 ),
        //       //                 onPressed: () {
        //       //                   Navigator.of(context).pop();
        //       //                 },
        //       //                 child: Text(
        //       //                   'មិនយល់ព្រម',
        //       //                   style: TextStyle(
        //       //                       fontFamily: 'DG',
        //       //                       fontSize: 15,
        //       //                       color: Colors.blue[800]),
        //       //                 ),
        //       //               ),
        //       //             ]),
        //       //       ),
        //       //     );
        //       //   },
        //       // );

        //       FirebaseFirestore.instance
        //           .collection('allstuff')
        //           .where('email', isEqualTo: user.email!)
        //           .get()
        //           .then(
        //         (QuerySnapshot querySnapshot) {
        //           for (var doc in querySnapshot.docs) {
        //             if (doc["role"] == 'admin') {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => AdminPage()),
        //               );
        //             } else if (doc["role"] == 'teacher') {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => TeacherPanel()),
        //               );
        //             } else if (doc["role"] == 'student') {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => StudentPage()),
        //               );
        //             } else {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => Profile_Page()),
        //               );
        //             }
        //           }
        //         },
        //       );
        //       return showModalBottomSheet(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return SingleChildScrollView(
        //               child: Container(
        //                 padding:
        //                     EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        //                 alignment: Alignment.center,
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                     FadeAnimation(
        //                       intervalStart: 0.3,
        //                       duration: Duration(milliseconds: 2000),
        //                       child: Image.asset(
        //                         'assets/images/PCCFPI.png',
        //                         width: 100,
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 15,
        //                     ),
        //                     FadeAnimation(
        //                       intervalStart: 0.5,
        //                       duration: Duration(milliseconds: 2000),
        //                       child: Text(
        //                         'សូមពិនិត្យមើលគណនីរបស់អ្នក!',
        //                         style: TextStyle(
        //                             fontFamily: 'DG',
        //                             fontSize: 20,
        //                             color: Colors.blue[800]),
        //                       ),
        //                     ),
        //                     FadeAnimation(
        //                       intervalStart: 0.8,
        //                       duration: Duration(milliseconds: 2000),
        //                       child: Text(
        //                         'ព្រោះគណនីរបស់អ្នកគ្មានក្នុងប្រព័ន្ធរបស់យើង​ទេ',
        //                         style: TextStyle(
        //                             fontFamily: 'DG',
        //                             fontSize: 15,
        //                             color: Colors.blue[800]),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           });
        //     },
        //     child: SvgPicture.asset(
        //       'assets/svg/logout.svg',
        //       color: red,
        //       width: 25,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 18,
        //   )
        // ],
      ),
      body: Profile_User(),
    );
  }
}

// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_declarations, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/about_me/about.dart';
import 'package:pccfpi/screen/widget/page_view/page_four.dart';
import 'package:pccfpi/screen/widget/theme/dark_mode.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:pccfpi/screen/widget/video/video_model/video_update.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';
import '../../../model/google_sign_in.dart';
import '../../../main_page.dart';
import '../../admin/admin__page.dart';
import '../../crud/crud_page.dart';
import '../../pagination/pagination_firebase.dart';
import '../../student/student_page.dart';
import '../Scholarship/scholarship_page.dart';
import '../google_sheet/inform_page.dart';
import '../master_plan/master_plan.dart';
import '../object/main_object.dart';
import '../object/IT/object.dart';
import '../page_view/news/news_/news_update.dart';
import '../page_view/news/news_page.dart';
import '../profile/profile_page.dart';
import '../register/register_page.dart';
import '../schedule/schedule_part.dart';
import '../teacher/panel/teacher_pages.dart';
import '../teacher/teacher_page.dart';
import '../teacher/teacher_update.dart';
import '../video/chewie/chewie_page.dart';
import '../video/chewiez.dart';
import '../video/iframe/iframe_page.dart';
import '../video/main_video/video_main.dart';
import '../video/video_model/vi.dart';
import '../video/video_model/video_page.dart';
import '../video/vlc_video.dart';
import '../web/web_blogger.dart';

import 'package:flutter/services.dart';

class MyDrawer extends StatefulWidget {
  // const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

final user = FirebaseAuth.instance.currentUser!;
final number = '012261242';

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Drawer(
          // elevation: 5,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 0.6, color: color_rgb))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              user.displayName!,
                              style: TextStyle(
                                  color: color_blue,
                                  fontSize: 17,
                                  fontFamily: 'DG',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(color: color_rgb, width: 0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.5),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/home-page.svg',
                              width: 15,
                              color: color_blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //set Time
                Container(
                  height: 56,
                  color: color_blue,
                  padding: EdgeInsets.only(left: 25),
                  child: Row(children: [
                    SvgPicture.asset(
                      'assets/svg/alarm-clock.svg',
                      width: 15,
                      color: Colors.white,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      '  ' +
                          DateFormat('dd-MM-yyyy KK:mm a').format(
                            DateTime.now(),
                          ),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'DG',
                          fontSize: 16.5),
                    ),
                  ]),
                ),

                //profile
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: Profile_Page(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/user (2).svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'គណនីរបស់អ្នក',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: Main_Object(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/book-open-cover.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'មុខវិជ្ជាសិក្សា',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                ///////
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 500),
                        isIos: true,
                        child: MasterPlan(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/books.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'កម្មវិធីសិក្សា',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('schedule')
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            alignment: Alignment.topCenter,
                            duration: Duration(milliseconds: 300),
                            isIos: true,
                            child: SchedulePage(
                              title: doc["title"],
                            ),
                          ),
                        );
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/calendar.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'កាលបរិច្ឆេទ',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 500),
                        isIos: true,
                        child: MainScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/edit.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'ធ្វើការចុះឈ្មោះ',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //webview
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 500),
                        isIos: true,
                        child: WebView_Blogger(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/world.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'គេហទំព័រ',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 500),
                        isIos: true,
                        child: Video_Main(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/play-alt.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'វីដេអូបង្រៀន',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('payyear')
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            alignment: Alignment.topCenter,
                            duration: Duration(milliseconds: 300),
                            isIos: true,
                            child: ScholarshipPage(
                              year1: doc['pay1'].toString(),
                              year2: doc['pay2'].toString(),
                              year3: doc['pay3'].toString(),
                              year4: doc['pay4'].toString(),
                            ),
                          ),
                        );
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/graduation-cap (1).svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'ថ្នាក់សិក្សា',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //teacher
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 500),
                        isIos: true,
                        child: Updata_Teacher(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/users-alt.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'សាស្រ្ដាចារ្យ',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //map_address
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () async {
                    final url = 'https://goo.gl/maps/AguBi7hEWFmeoTbr7';

                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        // forceSafariVC: true,
                        // forceWebView: true,
                        // enableJavaScript: true,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/map-marker (1).svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'ទីតាំង​',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //call
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () async {
                    launch('tel://$number');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/phone-call.svg',
                              width: 16,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'ទំនាក់ទំនង​',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svg/menu-dots-vertical.svg',
                          width: 15,
                          color: color_blue,
                        ),
                      ],
                    ),
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 0.6,
                        color: color_rgb,
                        child: Divider(
                          color: color_blue,
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Text(
                      //     'data',
                      //     style: TextStyle(color: color_blue),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                //contact
                //facebook
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () async {
                    final url =
                        'https://www.facebook.com/people/%E1%9E%80%E1%9E%B6%E1%9E%9A%E1%9E%B7%E1%9E%A2%E1%9E%94%E1%9F%8B%E1%9E%9A%E1%9F%86%E1%9E%94%E1%9E%8E%E1%9F%92%E1%9E%8F%E1%9E%BB%E1%9F%87%E1%9E%94%E1%9E%8E%E1%9F%92%E1%9E%8F%E1%9E%B6%E1%9E%9B%E1%9E%94%E1%9E%85%E1%9F%92%E1%9E%85%E1%9F%81%E1%9E%80%E1%9E%91%E1%9F%81%E1%9E%9F-%E1%9E%93%E1%9E%B7%E1%9E%84%E1%9E%9C%E1%9E%B7%E1%9E%87%E1%9F%92%E1%9E%87%E1%9E%B6%E1%9E%87%E1%9E%B8%E1%9E%9C%E1%9F%88-Pccfpi/100057637771481/';

                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        // forceSafariVC: true,
                        // forceWebView: true,
                        // enableJavaScript: true,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/facebook.svg',
                              width: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'FACEBOOK',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 13.5),
                            ),
                          ],
                        ),
                        // SvgPicture.asset(
                        //   'assets/svg/menu-dots-vertical.svg',
                        //   width: 15,
                        //   color: color_blue,
                        // ),
                      ],
                    ),
                  ),
                ),
                //telegram
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () async {
                    final url = 'https://t.me/pccfpi_Info';

                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        // forceSafariVC: true,
                        // forceWebView: true,
                        // enableJavaScript: true,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/telegram.svg',
                              width: 18,
                              color: Colors.blue[500],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'TELEGRAM',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 13.5),
                            ),
                          ],
                        ),
                        // SvgPicture.asset(
                        //   'assets/svg/menu-dots-vertical.svg',
                        //   width: 15,
                        //   color: color_blue,
                        // ),
                      ],
                    ),
                  ),
                ),
                //youtube
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () async {
                    final url = 'https://www.youtube.com/';

                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        // forceSafariVC: true,
                        // forceWebView: true,
                        // enableJavaScript: true,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/youtube.svg',
                              width: 18,
                              color: Colors.red,
                            ),
                            // Icon(
                            //   Icons.play_circle,
                            //   color: color_blue,
                            //   size: 22,
                            // ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'YOUTUBE',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 13.5),
                            ),
                          ],
                        ),
                        // SvgPicture.asset(
                        //   'assets/svg/menu-dots-vertical.svg',
                        //   width: 15,
                        //   color: color_blue,
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 0.6,
                        color: color_rgb,
                        child: Divider(
                          color: color_blue,
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Text(
                      //     'data',
                      //     style: TextStyle(color: color_blue),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                //setting
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent, width: 0.8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: About_Page(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    height: 56,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/info.svg',
                              width: 18,
                              color: color_blue,
                            ),
                            // Icon(
                            //   Icons.play_circle,
                            //   color: color_blue,
                            //   size: 22,
                            // ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'អំពីយើង v1.0.0',
                              style: TextStyle(
                                  color: color_blue,
                                  fontFamily: 'DG',
                                  fontSize: 13.5),
                            ),
                          ],
                        ),
                        // SvgPicture.asset(
                        //   'assets/svg/menu-dots-vertical.svg',
                        //   width: 15,
                        //   color: color_blue,
                        // ),
                      ],
                    ),
                  ),
                ),
                //Logout
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 13.5),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: color_blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 9),
                      height: 56,
                      color: color_blue,
                      alignment: Alignment.center,

                      // ignore: prefer_const_literals_to_create_immutables
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ចាក់ចេញ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'DG',
                                fontSize: 13.5),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/svg/enter-icon.svg',
                            width: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  //Alert Logout
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: color_rgb, width: 0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.5),
        ),
      ),
      child: Text(
        "ទេ",
        style: TextStyle(color: color_blue, fontFamily: 'DG', fontSize: 17),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color_blue,
        side: BorderSide(color: color_rgb, width: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.5),
        ),
      ),
      child: Text(
        "បាទ",
        style: TextStyle(color: Colors.white, fontFamily: 'DG', fontSize: 17),
      ),
      onPressed: () async {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.logout();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      title: Icon(
        Icons.warning_amber_sharp,
        color: Colors.red,
        size: 50,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            child: Column(
              children: [
                Text(
                  'តើពិតជាចាកចេញមែន?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: color_blue, fontFamily: 'DG', fontSize: 15),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Text(
                  "DO YOU WANT LOGOUT?",
                  style: TextStyle(
                      color: color_blue,
                      fontFamily: 'DG',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            cancelButton,
            continueButton,
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

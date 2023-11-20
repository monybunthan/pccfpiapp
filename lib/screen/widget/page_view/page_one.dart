import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/page_view/page_three.dart';
import 'package:pccfpi/screen/widget/web/web_blogger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main_page.dart';
import '../../admin/admin__page.dart';
import '../../student/student_page.dart';
import '../Scholarship/scholarship_page.dart';
import '../object/main_object.dart';
import '../profile/profile_page.dart';
import '../schedule/schedule_part.dart';
import '../teacher/panel/teacher_pages.dart';
import '../teacher/teacher_update.dart';
import '../theme/themes.dart';
import 'news/page_news.dart';

class Page_One extends StatefulWidget {
  const Page_One({super.key});

  @override
  State<Page_One> createState() => _Page_OneState();
}

final user = FirebaseAuth.instance.currentUser!;

class _Page_OneState extends State<Page_One> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              sliver: SliverGrid.count(
                childAspectRatio: (itemWidth / 40),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 1,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('allstuff')
                            .where('email', isEqualTo: user.email!)
                            .get()
                            .then(
                          (QuerySnapshot querySnapshot) {
                            for (var doc in querySnapshot.docs) {
                              if (doc["role"] == 'admin') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminPage()),
                                );
                              } else if (doc["role"] == 'teacher') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TeacherPanel()),
                                );
                              } else if (doc["role"] == 'student') {
                                FirebaseFirestore.instance
                                    .collection('student')
                                    .where('email', isEqualTo: user.email)
                                    .get()
                                    .then((QuerySnapshot querySnapshot) {
                                  // ignore: unused_local_variable

                                  for (var doc in querySnapshot.docs) {
                                    double op1 = doc['op1'] / 100;
                                    double op2 = doc['op2'] / 100;
                                    double op3 = doc['op3'] / 100;
                                    double op4 = doc['op4'] / 100;
                                    double op5 = doc['op5'] / 100;
                                    int total = doc['op1'] +
                                        doc['op2'] +
                                        doc['op3'] +
                                        doc['op4'] +
                                        doc['op5'];
                                    double totals = total / 5;
                                    print(total);
                                    print(totals);
                                    if (totals <= 50) {
                                      print('faild');
                                    } else if (totals >= 50 && totals <= 70) {
                                      print('Good');
                                    } else if (totals >= 70 && totals <= 100) {
                                      print('Very Good');
                                    } else {
                                      print('Please value');
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StudentPage(
                                          gender: doc['gender'],
                                          nameEng: doc['nameEng'],
                                          nameKH: doc['nameKH'],
                                          id: doc['id'],
                                          skill: doc['skill'],
                                        ),
                                      ),
                                    );
                                  }
                                });
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile_Page()),
                                );
                              }
                            }
                          },
                        );
                        return;
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.grey,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.displayName!,
                                  style: TextStyle(
                                      color: color_blue,
                                      fontFamily: 'DG',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  user.email!,
                                  style: TextStyle(
                                      color: Colors.red[500], fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Image.network(user.photoURL!),
                              );
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: NetworkImage(user.photoURL!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: color_rgb,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SliverPadding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              sliver: SliverGrid.count(
                childAspectRatio: (itemWidth / 130),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/book-open-cover.svg',
                            width: 25,
                            color: color_blue,
                          ),
                          Text(
                            'មុខវិជ្ជាសិក្សា',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_blue,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/calendar.svg',
                            width: 25,
                            color: color_blue,
                          ),
                          Text(
                            'កាលបរិច្ឆេទ',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_blue,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  //
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/world.svg',
                            width: 25,
                            color: color_blue,
                          ),
                          Text(
                            'គេហទំព័រ',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_blue,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  //
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/graduation-cap (1).svg',
                            width: 25,
                            color: color_blue,
                          ),
                          Text(
                            'ថ្នាក់សិក្សា',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_blue,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/users-alt.svg',
                            width: 25,
                            color: color_blue,
                          ),
                          Text(
                            'សាស្រ្ដាចារ្យ',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_blue,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  //
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/map-marker (1).svg',
                            width: 25,
                            color: color_blue,
                          ),
                          Text(
                            'ទីតាំង​',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_blue,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //search job
            SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              sliver: SliverGrid.count(
                childAspectRatio: (itemWidth / 40),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 1,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            alignment: Alignment.topCenter,
                            duration: Duration(milliseconds: 500),
                            isIos: true,
                            child: PageNews(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: color_blue,
                        side: BorderSide(color: color_rgb, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/search-dollar.svg',
                            width: 25,
                            color: Colors.white,
                          ),
                          Text(
                            'ស្វែងរកការងារ',
                            style: TextStyle(
                                fontFamily: 'DG', color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Social
            SliverPadding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              sliver: SliverGrid.count(
                childAspectRatio: (itemWidth / 130),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[
                  //

                  //
                  Container(
                    padding: const EdgeInsets.all(0),
                    color: Colors.green[300],
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        side: BorderSide(color: Colors.transparent, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/facebook.svg',
                            width: 25,
                            color: Colors.white,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: Colors.white,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  //

                  Container(
                    padding: const EdgeInsets.all(0),
                    color: Colors.green[500],
                    child: OutlinedButton(
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
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue[500],
                        side: BorderSide(color: Colors.transparent, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/telegram.svg',
                            width: 25,
                            color: Colors.white,
                          ),
                          Text(
                            'Telegram',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: Colors.white,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  //
                  Container(
                    padding: const EdgeInsets.all(0),
                    color: Colors.green[600],
                    child: OutlinedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     type: PageTransitionType.rightToLeft,
                        //     alignment: Alignment.topCenter,
                        //     duration: Duration(milliseconds: 500),
                        //     isIos: true,
                        //     child: LoggedInWidget(),
                        //   ),
                        // );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red,
                        side: BorderSide(color: Colors.transparent, width: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/youtube.svg',
                            width: 25,
                            color: Colors.white,
                          ),
                          Text(
                            'Youtube',
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: Colors.white,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

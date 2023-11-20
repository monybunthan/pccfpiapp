// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pccfpi/model/google_sign_in.dart';
import 'package:pccfpi/screen/widget/page_view/page_two.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'screen/widget/drawer/my_drawer.dart';
import 'screen/widget/page_view/news/news_page.dart';
import 'screen/widget/page_view/page_four.dart';
import 'screen/widget/page_view/page_one.dart';
import 'screen/widget/page_view/page_three.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({super.key, this.title});
  final title;
  @override
  State<LoggedInWidget> createState() => _LoginWegetState();
}

class _LoginWegetState extends State<LoggedInWidget> {
  final user = FirebaseAuth.instance.currentUser!;

  late int initialPage;

  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _page);
    super.initState();
  }

  List page = [
    Page_One(),
    Page_Two(),
    Page_Three(),
    Page_Four(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

//admob
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
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
          leading: Builder(
            builder: (context) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                  side: BorderSide(color: Colors.transparent, width: 0.8),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: SvgPicture.asset(
                  'assets/svg/menu-burger (1).svg',
                  width: 20,
                  color: color_rgb,
                ),
              );
            },
          ),
        ),
        drawer: MyDrawer(),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newpage) {
            //Show Admob
            // _incrementCounter();
            // showAd();
            setState(() {
              this._page = newpage;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Page_One(),
            Page_Two(),
            Page_Three(),
            Page_Four(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            //Show Admob
            // _incrementCounter();
            // showAd();
            this._pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          },
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 5,
          currentIndex: _page,
          selectedItemColor: color_blue,
          unselectedItemColor: Colors.blue,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: "info",
              icon: Icon(Icons.fiber_new_sharp),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search_outlined),
            ),
            BottomNavigationBarItem(
              label: "My",
              icon: Icon(Icons.person_outline_sharp),
            ),
          ],
        ),
      ),
    );
  }
}

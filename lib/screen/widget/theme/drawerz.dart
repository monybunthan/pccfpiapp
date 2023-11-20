// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pccfpi/screen/widget/drawer/my_drawer.dart';

import '../../../main_page.dart';

class Test_drawer extends StatelessWidget {
  const Test_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreen: LoggedInWidget(),
      menuScreen: MyDrawer(),
      angle: 0,
      duration: Duration(milliseconds: 600),
      borderRadius: 0,
      showShadow: false,
      menuBackgroundColor: Colors.white,
    );
  }
}

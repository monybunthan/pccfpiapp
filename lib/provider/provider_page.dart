// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pccfpi/screen/skip_page.dart';
import 'package:pccfpi/less/mainpages.dart';

import '../main_page.dart';
import '../screen/signup_page.dart';
import '../screen/widget/theme/drawerz.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // ignore: prefer_const_constructors
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return LoggedInWidget();
            } else if (snapshot.hasError) {
              // ignore: prefer_const_constructors
              return Center(child: Text('Something Went Wrong'));
            } else {
              return MainPage();
            }
          },
        ),
      );
}

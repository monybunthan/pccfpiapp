// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/themes.dart';
import '../drawer/my_drawer.dart';

class WebView_Blogger extends StatefulWidget {
  @override
  _WebView_BloggerState createState() => _WebView_BloggerState();
}

bool loading = true;

class _WebView_BloggerState extends State<WebView_Blogger> {
  @override
  void initState() {
    super.initState();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'គេហទំព័រក្រោមការថែទាំ',
              style: GoogleFonts.koulen(
                textStyle: TextStyle(color: color_blue, fontSize: 30),
              ),
            ),
            Text(
              'Website under maintenance',
              style: GoogleFonts.anton(
                textStyle: TextStyle(
                    color: Color.fromARGB(137, 0, 0, 0),
                    fontSize: 20,
                    letterSpacing: 0),
              ),
            ),
            Image.network(
                'https://cdn.dribbble.com/users/49067/screenshots/3710403/maintenance-panel800600.gif'),
            Text(
              'សូមព្យាយាមម្ដងទៀតនៅពេលក្រោយ !',
              style: GoogleFonts.battambang(
                textStyle: TextStyle(color: color_blue, fontSize: 18),
              ),
            ),
            Text(
              'Please try again later !',
              style: GoogleFonts.battambang(
                textStyle: TextStyle(color: color_blue, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    )
        // Stack(
        //   children: [
        //     WebView(
        //         // initialUrl: 'https://pccfpi.blogspot.com/',
        //         initialUrl:
        //             'https://viewer.millicast.com?streamId=PffTd8/lb1vfoab',
        //         javascriptMode: JavascriptMode.unrestricted,
        //         onPageFinished: (finish) {
        //           setState(() {
        //             loading = false;
        //           });
        //         }),
        //     loading == true
        //         ? const Center(
        //             child: CircularProgressIndicator(),
        //           )
        //         : const SizedBox(),
        //   ],
        // ),
        );
  }
}

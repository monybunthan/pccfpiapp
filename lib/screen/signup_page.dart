// ignore_for_file: prefer_const_constructors, deprecated_member_use, non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/model/google_sign_in.dart';
import 'package:provider/provider.dart';
//translate
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';

import 'widget/theme/themes.dart';
import 'skip_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 800,
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/PCCFPI.png',
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 25, right: 25, bottom: 13),
                        child: Column(
                          children: [
                            Text(
                              'សូមស្វាគមន៍',
                              style: TextStyle(
                                color: Colors.blue[800],
                                fontFamily: 'DG',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'វិទ្យាស្ថានពហុបច្ចេកទេសមិត្តភាពកម្ពុជា ចិនខេត្តព្រះសីហនុ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontFamily: 'DG',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ចំណាំ​​ ៖​ នេះជាកម្មវិធី បញ្ចប់សារណារបស់សិនិត្ស វិទ្យាស្ថានពហុបច្ចេកទេសមិត្តភាពកម្ពុជា ចិនខេត្តព្រះសីហនុ​តែបណ្ដុះ។​ ហើយកម្មវីធីនេះសម្រាប់ស្វែងយល់របស់មួយចំនួន ដែលមានខ្លះៗក្នុងសាលាតែប៉ុណ្ណោះ។​ សូមអរគុណ!',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: color_rgb,
                                            fontFamily: 'DG',
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            //
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 0.6,
                                    width: 130,
                                    color: color_rgb,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.angleDown,
                                    color: Colors.blue[800],
                                    size: 16,
                                  ),
                                  Container(
                                    height: 0.6,
                                    width: 130,
                                    color: color_rgb,
                                  )
                                ],
                              ),
                            ),
                            ReadMoreText(
                              'ព័ត៌មានបន្ថែម ៖​ កម្មវិធីតម្រូវអោយអ្នកចូលបាន ទាល់តែមានគណនី Google តែប៉ុណ្ណោះ។​ អរគុណ!',
                              trimLines: 1,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'បង្ហាញច្រើនទៀត',
                              trimExpandedText: '...បង្ហាញតិច',
                              lessStyle: TextStyle(
                                  fontFamily: 'DG', color: Colors.red),
                              moreStyle: TextStyle(
                                  color: Colors.red, fontFamily: 'DG'),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: color_rgb,
                                  fontFamily: 'DG'),
                            ),
                          ],
                        ),
                      ),

                      //Button Login
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: color_blue,
                            onPrimary: color_blue,
                            // onSurface: Colors.white,
                            minimumSize: Size(double.infinity, 56),
                            shadowColor: Colors.blue[800],
                            side: BorderSide(color: color_rgb, width: 0.3),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.3))),
                            elevation: 0,
                          ),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);

                            provider.googleLogin();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ធ្វើការចុះឈ្មោះ',
                            style: TextStyle(
                                fontFamily: 'DG',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Button Skip
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 25, right: 25),
                      //   child: ElevatedButton.icon(
                      //     style: ElevatedButton.styleFrom(
                      //       primary: color_blue,
                      //       onPrimary: color_blue,
                      //       // onSurface: Colors.white,
                      //       minimumSize: Size(double.infinity, 56),
                      //       shadowColor: Colors.blue[800],
                      //       side: BorderSide(
                      //           color: Color.fromARGB(255, 0, 85, 155),
                      //           width: 0.3),
                      //       shape: const BeveledRectangleBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(0.3))),
                      //       elevation: 0,
                      //     ),
                      //     onPressed: () {
                      //       //
                      //       Navigator.push(
                      //         context,
                      //         PageTransition(
                      //           type: PageTransitionType.theme,
                      //           alignment: Alignment.topCenter,
                      //           duration: Duration(milliseconds: 700),
                      //           isIos: true,
                      //           child: SkipPage(),
                      //         ),
                      //       );
                      //     },
                      //     icon: FaIcon(
                      //       FontAwesomeIcons.angleDoubleRight,
                      //       color: Colors.white,
                      //     ),
                      //     label: Text(
                      //       'ធ្វើការរំលងនេះ',
                      //       style: TextStyle(
                      //           fontFamily: 'DG',
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 15,
                      //           color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

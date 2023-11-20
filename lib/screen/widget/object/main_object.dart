// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/object/IT/object.dart';

import '../theme/themes.dart';
import 'accounting/object_account.dart';
import 'civil/object_civil.dart';
import 'eletric/object_ele.dart';

class Main_Object extends StatefulWidget {
  // const Main_Object({super.key});

  @override
  State<Main_Object> createState() => _Main_ObjectState();
}

class _Main_ObjectState extends State<Main_Object> {
  String txt = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'មុខវិជ្ជាសិក្សា',
          style: TextStyle(fontFamily: 'DG', color: color_rgb),
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

        ///
        ///
        flexibleSpace: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              left: 250,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.1,
                    alignment: Alignment.center,
                    image: AssetImage('assets/images/1024.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 7),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 0),
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: Object_Page(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/svg/tech-icon.svg',
                            color: color_rgb,
                            width: 35,
                          )),
                      title: Text('Information Technology (IT)',
                          style: TextStyle(fontFamily: 'DG', color: color_rgb)),
                      subtitle: Text('ច្រើនទៀត.....',
                          style: TextStyle(
                              fontFamily: 'DG',
                              color: Colors.grey[800],
                              fontSize: 13)),
                    ),
                  ),
                ),

                ///Account
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: Object_Account(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/svg/acc.svg',
                            color: color_rgb,
                            width: 35,
                          )),
                      title: Text('Accounting (គណនេយ្យ)',
                          style: TextStyle(fontFamily: 'DG', color: color_rgb)),
                      subtitle: Text('ច្រើនទៀត.....',
                          style: TextStyle(
                              fontFamily: 'DG',
                              color: Colors.grey[800],
                              fontSize: 13)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: Object_Ele(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/svg/elec.svg',
                            color: color_rgb,
                            width: 35,
                          )),
                      title: Text('Electricity​ ​(អគ្គិសនី)',
                          style: TextStyle(fontFamily: 'DG', color: color_rgb)),
                      subtitle: Text('ច្រើនទៀត.....',
                          style: TextStyle(
                              fontFamily: 'DG',
                              color: Colors.grey[800],
                              fontSize: 13)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 300),
                        isIos: true,
                        child: Object_Civil(
                          title: 'Civil Engineer',
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/svg/bb.svg',
                            color: color_rgb,
                            width: 33,
                          )),
                      title: Text('Civil Engineer',
                          style: TextStyle(fontFamily: 'DG', color: color_rgb)),
                      subtitle: Text('ច្រើនទៀត.....',
                          style: TextStyle(
                              fontFamily: 'DG',
                              color: Colors.grey[800],
                              fontSize: 13)),
                    ),
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

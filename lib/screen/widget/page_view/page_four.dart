// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class Page_Four extends StatefulWidget {
  @override
  State<Page_Four> createState() => _Page_FourState();
}

final user = FirebaseAuth.instance.currentUser!;

class _Page_FourState extends State<Page_Four> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Profile_User());
  }
}

class Profile_User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Image.network(
                user.photoURL!,
                fit: BoxFit.cover,
              ),
            ),
            DraggableScrollableSheet(
              minChildSize: 0.1,
              initialChildSize: 1,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //for user profile header
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(0), //border corner radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 3, // blur radius
                                offset:
                                    Offset(0, 2), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                              //you can set more BoxShadow() here
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 22, right: 22, top: 17, bottom: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: color_rgb,
                                  radius: 38.0,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user.photoURL!),
                                    radius: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        user.displayName!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color_rgb,
                                          fontFamily: "DG",
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        user.email!,
                                        style: TextStyle(
                                          // color: Colors.grey[500],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //performance bar

                        SizedBox(
                          height: 20,
                        ),
                        //container for about me

                        Container(
                          padding: EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/PCCFPI.png',
                                width: 100,
                              ),
                              Text(
                                "សូមស្វាគមន៍ " + user.displayName!,
                                style: TextStyle(
                                    color: color_rgb,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "DG",
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "សូមស្វាគមន៍ មកកាន់កម្មវិធីទូរស័ទ្ធរបស់ ពហុវិទ្យាស្ថានមិត្ដភាពកម្ពុជាចិន ខេត្ដព្រះសីហនុ។ កម្មវិធីបង្កើតមកសម្រាប់សម្រួលដល់សិក្សានុសិស្សដែលបញ្ចប់ការសិក្សានិងទាន់ចប់ ព្រមទាំងសិក្សានុសិស្សដែលបោះបង់ការសិក្សាចោល ដើម្បីសម្រួលយល់ដល់កម្មវិធីសិក្សារបស់សាលាដែលផ្ដល់ អោយសិស្សនិសិត្រ។",
                                textAlign: TextAlign.justify,
                                style:
                                    TextStyle(fontFamily: "DG", fontSize: 15),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        //Container for clients

                        //Container for reviews

                        Container(
                          padding: EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "ទំនាក់ទំនងព័ត៌មានបន្ថែម ៖",
                                style: TextStyle(
                                  color: color_rgb,
                                  fontSize: 18,
                                  fontFamily: "DG",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                // ignore: prefer_const_declarations
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
                                              child: SvgPicture.asset(
                                                'assets/svg/facebook.svg',
                                                width: 35,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Row(
                                          children: [
                                            // SvgPicture.asset(
                                            //   'assets/svg/youtube.svg',
                                            //   width: 35,
                                            //   color: Colors.red,
                                            // ),
                                            GestureDetector(
                                              onTap: () async {
                                                // ignore: prefer_const_declarations
                                                final url =
                                                    'https://www.youtube.com/';

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
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50.0),
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.play_circle,
                                                  size: 45,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                // ignore: prefer_const_declarations
                                                final url =
                                                    'https://t.me/Kalito_55555';

                                                if (await canLaunch(url)) {
                                                  await launch(
                                                    url,
                                                    // forceSafariVC: true,
                                                    // forceWebView: true,
                                                    // enableJavaScript: true,
                                                  );
                                                }
                                              },
                                              child: SvgPicture.asset(
                                                'assets/svg/telegram.svg',
                                                width: 35,
                                                color: Colors.blue[500],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),

                        //
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: red,
                                    size: 15,
                                  ),
                                  Text(
                                    ' ទូរស័ព្ទលេខ :',
                                    style: TextStyle(
                                        color: color_rgb,
                                        fontFamily: 'DG',
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "- CELLCARD",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 136, 0)),
                                  ),
                                  Text(' : '),
                                  Text("012345678")
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "- SMART",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Text('       : '),
                                  Text("016345678")
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "- METFONE",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 117, 98)),
                                  ),
                                  Text('  : '),
                                  Text("088345678")
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

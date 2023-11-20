// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_interpolation_to_compose_strings, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main_page.dart';

class NoteList extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Text(
                'សាស្រាច្ចារន៍',
                style: TextStyle(fontFamily: 'DG', color: color_blue),
              ),
              centerTitle: true,
              elevation: 0,
              snap: true,
              floating: true,
              leading: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent, width: 0.8),
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      alignment: Alignment.topCenter,
                      duration: Duration(milliseconds: 500),
                      isIos: true,
                      child: LoggedInWidget(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/svg/angle-square-left.svg',
                  width: 30,
                  color: color_blue,
                ),
              ),
            )
          ],
          body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
              stream: db.collection('notes').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  // ignore: curly_braces_in_flow_control_structures
                  return ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map(
                      (doc) {
                        final data = doc.data()! as Map<String, dynamic>;
                        return Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
                          color: Colors.white,
                          child: SafeArea(
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: color_rgb, width: 0.8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              color: Colors.white,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) =>
                                              Image.network(data["imageUrlz"]),
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(data["imageUrlz"]),
                                      ),
                                    ),
                                    title: Text(
                                      data["id"].toString() + data["titlez"],
                                      style: TextStyle(
                                          fontFamily: 'DG',
                                          color: color_blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "ជំនាញ់ ​៖ " + data["content"],
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 99, 99, 99),
                                          fontFamily: 'DG',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  //
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) =>
                                              Image.network(data["imageUrlz"]),
                                        );
                                      },
                                      child: Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data["imageUrlz"],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child:
                                            null /* add child content here */,
                                      ),
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: [
                                      //Phone call
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          side: BorderSide(
                                              color: color_rgb, width: 0.8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.5),
                                          ),
                                        ),
                                        onPressed: () async {
                                          final phonez = data["phone"];
                                          launch('tel://$phonez');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          child: Row(
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
                                                'ទំនាក់ទំនង់​',
                                                style: TextStyle(
                                                    color: color_blue,
                                                    fontFamily: 'DG',
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //Telegarm
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: color_rgb,
                                          side: BorderSide(
                                              color: color_rgb, width: 0.8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.5),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (await canLaunch(data["tel"])) {
                                            await launch(
                                              data["tel"],
                                            );
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svg/telegram.svg',
                                              width: 16,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'TELEGRAM',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'DG',
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Image.asset('assets/card-sample-image.jpg'),
                                  // Image.asset('assets/card-sample-image-2.jpg'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}

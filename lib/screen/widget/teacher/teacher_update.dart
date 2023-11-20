// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_interpolation_to_compose_strings, use_key_in_widget_constructors, camel_case_types, unused_import, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/provider/provider_page.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main_page.dart';

class Updata_Teacher extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'សាស្ដ្រាចារ្យ',
            style: TextStyle(fontFamily: 'DG', color: color_blue),
          ),
          // centerTitle: true,
          elevation: 0.5,
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
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 7),
            color: Colors.white,
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
                          color: Colors.transparent,
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
                                  Slidable(
                                    startActionPane: ActionPane(
                                        motion: const StretchMotion(),
                                        children: [
                                          SlidableAction(
                                            backgroundColor: Colors.white,
                                            icon: Icons.call,
                                            label: 'CALL',
                                            onPressed: (context) async {
                                              final phonez = data["phone"];
                                              launch('tel://$phonez');
                                            },
                                          ),
                                          SlidableAction(
                                            backgroundColor: color_rgb,
                                            icon: Icons.telegram,
                                            label: 'TELEGRAM',
                                            onPressed: (context) async {
                                              if (await canLaunch(
                                                  data["tel"])) {
                                                await launch(
                                                  data["tel"],
                                                );
                                              }
                                            },
                                          ),
                                        ]),
                                    child: ListTile(
                                      leading: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => Image.network(
                                                data["imageUrlz"]),
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(data["imageUrlz"]),
                                        ),
                                      ),
                                      title: Text(
                                        data["titlez"],
                                        style: TextStyle(
                                            fontFamily: 'DG',
                                            color: color_blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "ជំនាញ ​: " + data["content"],
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: 'DG',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //Profile Teacher
                                      trailing: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => Scaffold(
                                              appBar: AppBar(
                                                elevation: 0.5,
                                                backgroundColor: Colors.white,
                                                title: Text(
                                                  "Detail More",
                                                  style: TextStyle(
                                                      color: color_rgb),
                                                ),
                                                actions: [
                                                  OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0.8),
                                                      primary: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: SvgPicture.asset(
                                                      'assets/svg/cross_1.svg',
                                                      width: 15,
                                                      color: color_blue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //
                                              body: SingleChildScrollView(
                                                child: Center(
                                                  child: Container(
                                                    color: Colors.white,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                            vertical: 7),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.network(
                                                            data["imageUrlz"]),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          data["titlez"],
                                                          style: TextStyle(
                                                              color: color_blue,
                                                              fontFamily: 'DG',
                                                              fontSize: 25),
                                                        ),
                                                        Text(
                                                          data["content"],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily: 'DG',
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: color_blue,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
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

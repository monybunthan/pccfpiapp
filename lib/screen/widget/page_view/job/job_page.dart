// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class Job_Page extends StatefulWidget {
  @override
  State<Job_Page> createState() => _Job_PageState();
}

class _Job_PageState extends State<Job_Page> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Container(
      height: 150,
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 6, right: 6),
          child: StreamBuilder<QuerySnapshot>(
            stream: db.collection('jobs').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                // ignore: curly_braces_in_flow_control_structures
                return ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map(
                    (doc) {
                      final data = doc.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  color_rgb, //                   <--- border color
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) =>
                                              Image.network(data["image"]),
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff7c94b6),
                                          image: DecorationImage(
                                            image: NetworkImage(data["image"]),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                          border: Border.all(
                                            color: color_rgb,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, top: 15, bottom: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["title"],
                                      style: TextStyle(
                                          fontFamily: 'DG', color: color_blue),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data["cpname"],
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: color_blue),
                                        ),
                                        Text(
                                          " / " + data["address"] + " / ",
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: color_blue),
                                        ),
                                        Text(
                                          data["data"],
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "CATEGORY : " +
                                              data["cat"] +
                                              "          " +
                                              "SALARY : ",
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: color_blue),
                                        ),
                                        Text(
                                          data["jobtime"],
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "EXPERIENCE : " +
                                              data["ex"] +
                                              "          " +
                                              "SALARY : ",
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: color_blue),
                                        ),
                                        Text(
                                          data["salary"],
                                          style: TextStyle(
                                              fontFamily: 'DG',
                                              fontSize: 10,
                                              color: Colors.red),
                                        ),
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
                  ).toList(),
                );
            },
          ),
        ),
      ),
    );
  }
}

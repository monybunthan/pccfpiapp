// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class Job_ho extends StatefulWidget {
  @override
  State<Job_ho> createState() => _Job_hoState();
}

class _Job_hoState extends State<Job_ho> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
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
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map(
                    (doc) {
                      final data = doc.data()! as Map<String, dynamic>;
                      return Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.all(10),
                            // height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: color_rgb,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              onTap: () {},
                              leading: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) =>
                                        Image.network(data["image"]),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff7c94b6),
                                    image: DecorationImage(
                                      image: NetworkImage(data["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(
                                      color: color_rgb,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                data["title"],
                                style: TextStyle(
                                    fontFamily: 'DG',
                                    fontSize: 12,
                                    color: color_blue),
                              ),
                              trailing: Text(
                                data["salary"],
                                style: TextStyle(color: Colors.red),
                              ),
                              subtitle: Text(
                                data["cpname"] + data["address"] + data["data"],
                                style: TextStyle(
                                  color: color_blue,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ));
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

// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, avoid_function_literals_in_foreach_calls, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pccfpi/screen/widget/object/model_object.dart';

import '../../theme/themes.dart';
// import '../theme/themes.dart';
import 'model_civil.dart';

class Object_Civil extends StatefulWidget {
  Object_Civil({super.key, required this.title});
  final String title;

  @override
  State<Object_Civil> createState() => _Object_PageState();
}

class _Object_PageState extends State<Object_Civil> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('civil')
        .orderBy('id', descending: false)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              // print(document.reference.id);
              docIDs.add(document.reference.id);
            }));
  }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
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
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: getDocId(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: color_rgb, width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: ModelCivil(
                        documentId: docIDs[index],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}

                      // child: ListTile(
                      //   title: GetUserName(documentId: docIDs[index]),
                      //   tileColor: Colors.white,
                      // ),
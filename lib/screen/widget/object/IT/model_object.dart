// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  Future addUserDetails(
    String object,
    int id,
  ) async {
    await FirebaseFirestore.instance.collection('object').add({
      'object': object,
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    // get the collection

    CollectionReference users = FirebaseFirestore.instance.collection('object');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['img']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
            title: Text(
              data['object'].toString(),
              style: TextStyle(color: color_rgb, fontFamily: 'DG'),
            ),
            subtitle: Text(
              '${data['sub']}',
              style: TextStyle(color: Colors.grey[800], fontFamily: 'DG'),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/playstore.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
            title: Text(
              'កំពុងផ្ទុក សូមរង់ចាំ ....',
              style: TextStyle(color: color_rgb, fontFamily: 'DG'),
            ),
            subtitle: Text(
              'loading please wait ...',
              style: TextStyle(color: Colors.grey[800], fontFamily: 'DG'),
            ),
          ),
        );
        ;
      },
    );
  }
}

// Text(
//             'ID: ${data['id']}  ${data['object']}',
//             style: TextStyle(fontFamily: 'DG'),
//           )
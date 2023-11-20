import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class DetailMe extends StatefulWidget {
  const DetailMe({super.key, required this.email});

  final String email;

  @override
  State<DetailMe> createState() => _DetailMeState();
}

class _DetailMeState extends State<DetailMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FirestoreListView(
        query: FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: widget.email),
        loadingBuilder: (_) => const Center(child: CircularProgressIndicator()),
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> data = snapshot.data();
          // Timestamp t = data['data'] as Timestamp;
          return Container(
            child: Center(
                child: Column(
              children: [
                Text(
                  data['email'],
                  style: TextStyle(color: Colors.black),
                ),
                Text(data['gender'] ?? 'null')
              ],
            )),
          );
        },
      ),
    );
  }
}

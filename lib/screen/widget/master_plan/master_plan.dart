import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pccfpi/screen/widget/master_plan/pdf/view_pdf.dart';

import '../theme/themes.dart';

class MasterPlan extends StatefulWidget {
  const MasterPlan({super.key});

  @override
  State<MasterPlan> createState() => _AccountStreamState();
}

class _AccountStreamState extends State<MasterPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "កម្មវិធីសិក្សា",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: color_blue,
                    fontFamily: 'DG',
                  ),
                ),
              ],
            ),
          ],
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('masterplan').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: color_rgb, width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(color: Colors.transparent, width: 0.8),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              alignment: Alignment.topCenter,
                              duration: Duration(milliseconds: 300),
                              isIos: true,
                              child: MyPdfViewer(
                                pdf: data['pdf'],
                                title: data['title'],
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          trailing: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/1024.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                          ),
                          leading: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data['img']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                ),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            'មើលបន្ថែម',
                            style: TextStyle(
                                color: Colors.black54, fontFamily: 'DG'),
                          ),
                          title: Text(
                            data['title'].toString(),
                            style: TextStyle(
                                color: color_rgb,
                                fontFamily: 'DG',
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

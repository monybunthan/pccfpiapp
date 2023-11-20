// ignore_for_file: use_key_in_widget_constructors, camel_case_types, unused_field, prefer_final_fields, prefer_const_constructors, unnecessary_cast, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccfpi/screen/widget/page_view/news/news_/pageview_news.dart';
import 'package:readmore/readmore.dart';

import '../../../theme/themes.dart';

class News_Time extends StatefulWidget {
  // const News_Time({super.key});

  @override
  State<News_Time> createState() => _News_TimeState();
}

class _News_TimeState extends State<News_Time> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: FirestoreListView(
            query: FirebaseFirestore.instance
                .collection('news')
                .orderBy('id', descending: true),
            loadingBuilder: (_) => Center(child: CircularProgressIndicator()),
            itemBuilder: (context, snapshot) {
              Map<String, dynamic> data =
                  snapshot.data() as Map<String, dynamic>;
              // Timestamp t = data['data'] as Timestamp;
              return Container(
                padding: EdgeInsets.only(left: 7, right: 7, top: 6),
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageViewNews(
                          content: data['content'],
                          data: data['data'],
                          image: data['image'],
                          subtitle: data['subtitle'],
                          title: data['title'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Text(
                            data["data"].toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          title: Text(
                            data["title"],
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.koulen(
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: color_rgb,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "ប្រភព​ : " + data["subtitle"],
                            style: GoogleFonts.battambang(
                              textStyle: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
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
                                builder: (_) => Image.network(data["image"] ??
                                    'https://firebasestorage.googleapis.com/v0/b/pccfpi-f8ce0.appspot.com/o/298538572_740996640502221_8489804046801673969_n.jpg?alt=media&token=dafcc1c8-cf18-4f90-993e-9694be8612fb'),
                              );
                            },
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      color_rgb, //                   <--- border color
                                  width: 1,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    data["image"],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: null /* add child content here */,
                            ),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            //Phone call
                            Text(
                              data["content"],
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: GoogleFonts.battambang(
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            // ReadMoreText(
                            //   data["content"],
                            //   trimLines: 1,
                            //   trimMode: TrimMode.Line,
                            //   trimCollapsedText: "Show More",
                            //   trimExpandedText: "Show Less",
                            // )
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
          ),
        ),
      ),
    );
  }
}

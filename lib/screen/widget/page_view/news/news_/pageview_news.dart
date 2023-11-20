import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/themes.dart';

class PageViewNews extends StatefulWidget {
  const PageViewNews(
      {super.key,
      required this.content,
      required this.data,
      required this.image,
      required this.subtitle,
      required this.title});

  final String content;
  final String data;
  final String image;
  final String subtitle;
  final String title;

  @override
  State<PageViewNews> createState() => _PageViewNewsState();
}

class _PageViewNewsState extends State<PageViewNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: color_rgb,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.koulen(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: color_rgb,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Image.network(widget.image),
                );
              },
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: color_rgb, //                   <--- border color
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'ប្រភព៖​ ${widget.subtitle} ',
                  style: TextStyle(
                    fontFamily: 'DG',
                    fontSize: 16,
                    color: color_rgb,
                  ),
                ),
                Text(
                  widget.data,
                  style: const TextStyle(
                    fontFamily: 'DG',
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              widget.content,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'DG',
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

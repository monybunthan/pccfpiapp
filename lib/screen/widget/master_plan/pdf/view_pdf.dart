import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../theme/themes.dart';

class MyPdfViewer extends StatefulWidget {
  const MyPdfViewer({super.key, required this.pdf, required this.title});

  final String pdf;

  final String title;

  @override
  State<MyPdfViewer> createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
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
                  widget.title,
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
      body:
          // link fron internet
          SfPdfViewer.network(
        widget.pdf,
      ),
    );
  }
}

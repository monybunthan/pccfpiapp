import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Iframe_Page extends StatefulWidget {
  // const Iframe_Page({super.key});

  @override
  State<Iframe_Page> createState() => _Iframe_PageState();
}

class _Iframe_PageState extends State<Iframe_Page> {
  String htmlData = """<html>
  <title>My Website</title>
<body>
  <div id="fb-root"></div>
  <script async defer src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2"></script>
  <h1>My Video Player</h1>
  <div class="fb-video"
    data-href="https://www.facebook.com/FacebookDevelopers/posts/10151471074398553"
    data-width="500"
    data-allowfullscreen="true"></div>
</body>
</html>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML'),
      ),
      body: Html(data: htmlData),
    );
  }
}

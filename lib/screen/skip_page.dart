// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SkipPage extends StatefulWidget {
  SkipPage({Key? key}) : super(key: key);

  @override
  _SkipPageState createState() => _SkipPageState();
}

class _SkipPageState extends State<SkipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('Skip-Page'),
      ),
    );
  }
}

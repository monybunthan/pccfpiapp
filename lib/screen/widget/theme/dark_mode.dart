import 'package:flutter/material.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';

class Dark_Mode extends StatefulWidget {
  const Dark_Mode({super.key});

  @override
  State<Dark_Mode> createState() => _Dark_ModeState();
}

bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme =
    ThemeData(primarySwatch: Colors.lightGreen, brightness: Brightness.light);

ThemeData _darkTheme =
    ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);

class _Dark_ModeState extends State<Dark_Mode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            icon: Icon(_iconBool ? _iconDark : _iconLight),
            onPressed: () {
              setState(() {
                _iconBool = !_iconBool;
              });
            },
          )
        ]),
      ),
    );
  }
}

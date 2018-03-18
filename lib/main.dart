import 'package:flutter/material.dart';

import 'package:crypto_display/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto Display',
      theme: new ThemeData(
        primaryColor: Colors.grey[300],
      ),
      home: new HomePage(
          title: 'Crypto Display'),
    );
  }
}

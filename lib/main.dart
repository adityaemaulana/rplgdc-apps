import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rplgdc/create_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.9)));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CreateArtikel(),
      ),
    );
  }
}

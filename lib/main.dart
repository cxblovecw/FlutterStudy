import 'package:FlutterStudy/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'tabs.dart';
void main()=>runApp(App());

class App extends StatelessWidget{
  bool logined=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp",
      home:logined?Tabs():LoginPage(),
    );
  }
}
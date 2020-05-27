import 'package:FlutterStudy/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:FlutterStudy/utils/storage.dart';
import 'tabs.dart';
void main()async=>{
  runApp(App())
};

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
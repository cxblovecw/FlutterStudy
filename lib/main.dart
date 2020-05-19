import 'package:flutter/material.dart';
import 'tabs.dart';
void main()=>runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp",
      home: Tabs(),
    );
  }
}
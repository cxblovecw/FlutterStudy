import 'package:flutter/material.dart';

class ChatImage extends StatefulWidget {
  @override
  _ChatImageState createState() => _ChatImageState();
}

class _ChatImageState extends State<ChatImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.36,
      width: double.infinity,
      child:Text("我是发送图片功能")
    );
  }
}
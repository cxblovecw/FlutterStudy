import 'package:flutter/material.dart';

class ChatEmoji extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.36,
      width: double.infinity,
      child: Text("我是表情包功能"),
    );
  }
}
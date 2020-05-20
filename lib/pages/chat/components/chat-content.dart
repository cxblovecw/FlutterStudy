import 'package:FlutterStudy/pages/chat/components/chat-bar.dart';
import 'package:FlutterStudy/pages/chat/components/chat-record.dart';
import 'package:flutter/material.dart';

class ChatContent extends StatefulWidget {
  @override
  _ChatContentState createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: ListView(
          children: <Widget>[
            
          ],
        )),
        Container(
          color:Color.fromRGBO(220, 220, 220,0.2),
          child: ChatBar(),
        )
      ],
    );
  }
}
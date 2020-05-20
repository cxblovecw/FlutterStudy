import 'package:FlutterStudy/components/search/search.dart';
import 'package:FlutterStudy/pages/message/message-item/message-item.dart';
import 'package:flutter/material.dart';
class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SearchBar(),
        MessageItem("https://c-ssl.duitang.com/uploads/item/201803/19/20180319132911_UxCLe.jpeg","张三","哈哈哈","20:15")
      ],
    );
  }
}
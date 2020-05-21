import 'package:FlutterStudy/pages/chat/chat-content.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  ChatPage(this.name);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black,),
        leading: IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,size: 25.0,), onPressed:(){
          Navigator.of(context).pop();
        }),
        title:Text("${widget.name}",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.phone), onPressed: (){
            print("打电话");
          }),
          IconButton(icon: Icon(Icons.menu), onPressed: (){
            print("打开菜单");
          }),
        ],
      ),
      body: ChatContent(),
    );
  }
}
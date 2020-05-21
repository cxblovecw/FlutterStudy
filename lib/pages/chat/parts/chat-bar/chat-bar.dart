import 'dart:async';
import 'dart:convert';

import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-emoji.dart';
import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-image.dart';
import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-voice.dart';
import 'package:flutter/material.dart';

class ChatBar extends StatefulWidget {
  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  // 控制聊天功能导航条的显示和隐藏
  bool offstage=true;
  // 输入框的行数
  int maxline=1;
  // 聊天导航条当前位置 0为置空，即都不显示，图标也不高亮
  int currentIndex=0;
  List<Widget> chatBarContent=[
    Container(),
    ChatVoice(),
    ChatImage(),
    Container(),
    ChatEmoji(),
    Container(),
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20,right: 20.0,top: 10,bottom: 10),
          padding: EdgeInsets.only(left: 25,right: 20.0),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          constraints: BoxConstraints(
            minHeight: 30.0,
            maxHeight: 120.0
          ),
          child:TextField(
            maxLines: maxline,
            decoration: InputDecoration(border:InputBorder.none),
            // 输入框发生改变时 监听长度 控制行数
            onChanged:(value){
              var data=Utf8Encoder().convert(value);
              print(data.length);
              setState(() {
                if(data.length>48){
                  maxline=3;
                }else{
                  maxline=1;
                }
              });
            },
            onTap: (){
              setState(() {
                offstage=true;
                currentIndex=0;
              });
            },
          ),
        ),
        // 聊天功能导航条
        Row(
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.mic,color:currentIndex==1?Colors.blue:Colors.black54,), onPressed: (){
              showOrHide(1,context);
            }),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.photo_size_select_actual,color:currentIndex==2?Colors.blue:Colors.black54,), onPressed: (){
              showOrHide(2,context);
            }),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.camera_alt,color:currentIndex==3?Colors.blue:Colors.black54,), onPressed: (){
              showOrHide(3,context);
            }),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.tag_faces,color:currentIndex==4?Colors.blue:Colors.black54), onPressed: (){
              showOrHide(4,context);
            }),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.folder_open,color:currentIndex==5?Colors.blue:Colors.black54), onPressed: (){
              showOrHide(5,context);
            }),flex: 1,),
          ],
        ),
        // 聊天功能导航条对应的内容部分
        Offstage(
          offstage: offstage,
          child:chatBarContent[currentIndex],
        ),
    ],
    );
  }
  showOrHide(index,context){
    FocusScope.of(context).requestFocus(FocusNode());
    new Timer(new Duration(milliseconds: 200),(){
    setState(() {
      if(offstage==true){
        currentIndex=index;
        offstage=false;
      }else if(currentIndex!=index){
        currentIndex=index;
      }else{
        currentIndex=0;
        offstage=true;
      }
    });
   });
  }
}
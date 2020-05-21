import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-camera.dart';
import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-emoji.dart';
import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-image.dart';
import 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-voice.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
    Container(),
    Container(),
    ChatEmoji(),
    Container(),
  ];
  String text="";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var controller=new TextEditingController.fromValue(
      TextEditingValue(
        text: text,
        selection: new TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: text.length)))
    );
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
            controller: controller,
            maxLines: maxline,
            decoration: InputDecoration(border:InputBorder.none),
            // 输入框发生改变时 监听长度 控制行数
            onChanged:(value){
              
              var data=Utf8Encoder().convert(value);
              print(data.length);
              setState(() {
                // 这个是必须的 有了控制器之后 输入框中的内容由其中的text属性决定
                text=value;
                if(data.length>48){
                  maxline=3;
                }else{
                  maxline=1;
                }
              });
            },
            onSubmitted: (value){
              print("发送信息");
              controller.clear();
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
              print(Permission.microphone.status);
              Permission.microphone.status.isGranted.then((value) =>{
                if(value==false){
                  Permission.microphone.request().then((value) => {
                    print("请求权限")
                  })
                }else{
                  print("有权限")
                }
              });
              // if(){
              //   print("没有权限");
              // }else{
              //   print("有权限");
              // }
            }),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.photo_size_select_actual,color:currentIndex==2?Colors.blue:Colors.black54,), onPressed: (){
              getImages().then((value) =>{
             
              });
              // showOrHide(2,context);
            }),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.camera_alt,color:currentIndex==3?Colors.blue:Colors.black54,), onPressed: (){
              openCamera();
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
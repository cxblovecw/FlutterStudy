// import 'package:FlutterStudy/pages/chat/parts/chat-vioce-call/chat-voice.dart';
import 'package:FlutterStudy/utils/AppID.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

part 'package:FlutterStudy/pages/chat/parts/chat-bar/chat-bar.dart';
part 'package:FlutterStudy/pages/chat/chat-content.dart';
part 'package:FlutterStudy/pages/chat/parts/chat-video-call/chat-video.dart';
part 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-camera.dart';
part "package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-emoji.dart";
part "package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-image.dart";
part "package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-voice.dart";



class ChatPage extends StatefulWidget {
  final String name;
  ChatPage(this.name);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // 是否通话中 用于控制最小化时 浮动按钮的显示 
  bool isCalling=false;

  @override
  void initState() { 
    super.initState();
  }
  // 将此方法传递给子widget 赋予子widget控制父widget的state的能力
  closeCall(){
    setState(() {
      isCalling=false;
    });
  }
  toVideo()async{
    // 创建实例
    await AgoraRtcEngine.create(APP_ID);
    // 启用视频模块
    await AgoraRtcEngine.enableVideo();
    // 加入频道
    await AgoraRtcEngine.joinChannel(null, '110', null,0).then((value) => {
      setState((){
        isCalling=true;
      })
    });

    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
      return VideoCall(closeCall);
    }));
  }
  // 清除TextField的焦点
  clearFocus(){
    FocusScope.of(context).requestFocus(new FocusNode());
  }
  @override
  Widget build(BuildContext context) {
    // 在Scaffold外部包裹GestureDetector 用于点击消除TextField焦点
    return GestureDetector(
      onTap: (){clearFocus();},
      child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black,),
        // 左侧返回按钮
        leading: IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,size: 25.0,), onPressed:(){
          Navigator.of(context).pop();
        }),
        title:Text("${widget.name}",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600),),
        // 右侧按钮
        actions: <Widget>[
          // 点击 底部出现模态菜单
          IconButton(icon: Icon(Icons.phone), onPressed: (){
            clearFocus();
            // 底部模态框
            showModalBottomSheet(context: context, builder:(context){
              return Container(
                decoration: BoxDecoration(
                ),
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      title: Text("语音通话",textAlign: TextAlign.center,),
                      onTap: (){
                        // 跳转至语音页面
                        toVideo();
                        // 隐藏模态框
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("视频通话",textAlign: TextAlign.center,),
                      onTap: (){
                        toVideo();
                        // 隐藏模态框
                        Navigator.pop(context);
                      }
                    )
                  ],
               ),
              );
            });
          }),
          IconButton(icon: Icon(Icons.menu), onPressed: (){
            clearFocus();
            print("打开菜单");
          }),
        ],
      ),
      body:Stack(
      children: <Widget>[
        ChatContent(),
        // 根据isCalling的值 控制最小化浮动按钮的显示与否
        isCalling?Positioned(
          right: 15,bottom: 120,
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color:Colors.blue,
              borderRadius: BorderRadius.circular(27)
            ),
            child: IconButton(icon: Icon(Icons.phone_in_talk,color: Colors.white,),onPressed: toVideo),
        )):Container(),
        Positioned(
          left: 0,bottom: 0,right: 0,
          child: Container(
            color:Color.fromRGBO(220, 220, 220,0.2),
            child: ChatBar(),
        ))
      ],
    )
    )
    );
  }
}

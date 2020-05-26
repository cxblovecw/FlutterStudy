import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

part 'package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-camera.dart';
part "package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-emoji.dart";
part "package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-image.dart";
part "package:FlutterStudy/pages/chat/parts/chat-bar-content/chat-voice.dart";



class XXX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          
        ],
      ),
    );
  }
}

class ChatBar extends StatefulWidget {
  @override
  _ChatBarState createState() => _ChatBarState();
}
String inputText="";

class _ChatBarState extends State<ChatBar> {
  // 控制聊天功能导航条的显示和隐藏
  bool offstage=true;
  // 输入框的行数
  int maxline=1;
  // 聊天导航条当前位置 0为置空，即都不显示，图标也不高亮
  int currentIndex=0;
  List<Widget> chatBarContent;
  static final TextEditingController controller=new TextEditingController.fromValue(
      TextEditingValue(
        text:inputText,
        selection: new TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: inputText.length)))
    );
  @override
  void initState() {
    super.initState();
    print("初始化");
    
  }
  @override
  Widget build(BuildContext context) {
    chatBarContent=[
      Container(),
      ChatVoice(),
      Container(),
      Container(),
      ChatEmoji(controller),
      Container(),
    ];
    return Wrap(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20.0,top: 10,bottom: 0),
                padding: EdgeInsets.only(left: 25,right: 20.0,top: 0,bottom: 0),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child:TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    contentPadding:const EdgeInsets.symmetric(vertical: 0)),
                    scrollPadding:const EdgeInsets.symmetric(vertical: 0),
                  // 输入框发生改变时 监听长度 控制行数
                  onChanged:(value){
                    setState(() {
                      inputText=value;
                    });
                  },
                  onSubmitted: (value){
                    print("发送信息");
                    inputText="";
                    controller.clear();
                  },
                  onTap: (){
                    setState(() {
                      offstage=true;
                      currentIndex=0;
                    });
                    print("????");
                  },
                ),
            ),
            ),
            GestureDetector(
              onTap: (){
                print(inputText);
              },
              child: Container(
                height: 30,
                width: 75,
                margin: EdgeInsets.only(top: 12),
                alignment: Alignment.center,
                child: Text("发送",style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ],
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
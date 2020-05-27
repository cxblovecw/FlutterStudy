import 'package:FlutterStudy/pages/chat/parts/chat-vioce-call/chat-voice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterStudy/pages/chat/parts/chat-bar/chat-bar.dart';
part 'package:FlutterStudy/pages/chat/chat-content.dart';

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
        // 左侧返回按钮
        leading: IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,size: 25.0,), onPressed:(){
          Navigator.of(context).pop();
        }),
        title:Text("${widget.name}",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600),),
        // 右侧按钮
        actions: <Widget>[
          // 点击 底部出现模态菜单
          IconButton(icon: Icon(Icons.phone), onPressed: (){
            showModalBottomSheet(context: context, builder:(context){
              return Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      title: Text("语音通话",textAlign: TextAlign.center,),
                      onTap: (){
                        // 使用pushReplacement，否侧从通话回来 菜单不消失
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context){
                          return VoiceCall();
                        }));
                      },
                    ),
                    ListTile(
                      title: Text("视频通话",textAlign: TextAlign.center,),
                      onTap: (){
                        // 使用pushReplacement，否侧从通话回来 菜单不消失
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context){
                          return VideoCall();
                        }));
                      },
                    )
                  ],
               ),
              );
            });
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


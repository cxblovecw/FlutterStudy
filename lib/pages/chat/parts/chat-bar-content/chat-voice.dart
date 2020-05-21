import 'package:flutter/material.dart';



class ChatVoice extends StatefulWidget {
  @override
  _ChatVoiceState createState() => _ChatVoiceState();
}

class _ChatVoiceState extends State<ChatVoice> {
  // 两边按钮的透明度
  double opacity=0;
  // 当前hint的下表 用于切换提示
  int currentIndex=0;
  // 提示列表 即按钮上方的文字提示
  List<String> hint=[
    "按住说话",
    "正在说话",
    "松手转文字",
    "松手取消发送",
  ];
  // 语音转文字的按钮
  Color voiceToTxt=Colors.black12;
  // 取消发送
  Color cancel=Colors.black12;
  @override
  Widget build(BuildContext context) {
     double width=MediaQuery.of(context).size.width;
     double height=MediaQuery.of(context).size.height;
     return Container(
      height: MediaQuery.of(context).size.height*0.36,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Opacity(
              child: Container(
                height: 60.0,
                width: 60.0,
                margin: EdgeInsets.fromLTRB(width/6-30, 0, width/6-30, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: voiceToTxt,
                ),
                child: IconButton(icon: Icon(Icons.translate),onPressed: (){}),
            ),opacity: opacity)
          ),
          Expanded(
            child: Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(hint[currentIndex],),
                  Container(height:height*0.18-60),
                  GestureDetector(
                    onLongPress: (){
                      print("长按中");
                      setState(() {
                        opacity=1;
                        currentIndex=1;
                      });
                    },
                    // 注意：移动时候左边位置 是从按钮的左边开始的
                    onLongPressMoveUpdate: (value){
                      var offset=value.localPosition;
                      if((offset.dx>((-width/2)+70))&&(offset.dx<(-width/6+30))&&(offset.dy>15)&&(offset.dy<70)){
                        setState(() {
                          print("语音转文字");
                          currentIndex=2;
                          voiceToTxt=Colors.green;
                        });
                      }else if((offset.dy>15)&&(offset.dy<70)&&(offset.dx>50+width/6)&&(offset.dx<width/3+50)){
                        print("取消发送");
                        setState(() {
                          currentIndex=3;
                          cancel=Colors.red;
                        });
                      }else{
                        setState(() {
                          currentIndex=1;
                          voiceToTxt=Colors.black12;
                        });
                      }
                     
                    },
                    onLongPressEnd: (value){
                      print(value.localPosition);
                      setState(() {
                        opacity=0;
                        currentIndex=0;
                        voiceToTxt=Colors.black26;
                      });
                    },
                    child:Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color:Colors.black12
                    ),
                    child:Icon(Icons.mic),
                    )
                  ),
                
                ],
            )
            )
          ),
          Expanded(
            child: Opacity(
              child: Container(
                height: 60.0,
                width: 60.0,
                margin: EdgeInsets.fromLTRB(width/6-30, 0, width/6-30, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: cancel,
                ),
                child: IconButton(icon: Icon(Icons.delete),onPressed: (){}),
            ),opacity: opacity)
          )
        ],
      ),
    );
  }
}
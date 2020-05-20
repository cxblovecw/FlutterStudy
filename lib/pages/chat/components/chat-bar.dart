import 'dart:convert';

import 'package:flutter/material.dart';

class ChatBar extends StatefulWidget {
  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  int maxline=1;
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
            }
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.mic,color: Colors.black54,), onPressed: (){}),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.photo_size_select_actual,color: Colors.black54,), onPressed: (){}),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.camera_alt,color: Colors.black54,), onPressed: (){}),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.tag_faces,color: Colors.black54,), onPressed: (){}),flex: 1,),
            Expanded(child: IconButton(icon: Icon(Icons.folder_open,color: Colors.black54,), onPressed: (){}),flex: 1,),
          ],
        )
    ],
    );
  }
}
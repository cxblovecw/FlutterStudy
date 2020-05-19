import 'package:flutter/material.dart';

class MyDrawerFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      padding: EdgeInsets.fromLTRB(25,0,0,30),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          IconButton(icon:Icon(Icons.settings),onPressed: (){}),
          IconButton(icon:Icon(Icons.star),onPressed: (){}),
          IconButton(icon:Icon(Icons.settings),onPressed: (){}),
        ]
      )
    );
  }
}
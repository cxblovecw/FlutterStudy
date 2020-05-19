import 'package:flutter/material.dart';
import 'package:FlutterStudy/pages/message.dart';
import 'package:FlutterStudy/pages/contact.dart';
import 'package:FlutterStudy/pages/moments.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  String title="消息";
  int index=0;
  List<Widget> tabsList=[
    MessagePage(),
    ContactPage(),
    MomontsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("$title"),
        centerTitle: true,
        leading: Leading(),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
        })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children:[
            DrawerHeader(child: Text("抽屉头"),padding: EdgeInsets.all(20),),
            ListTile(
              leading:Icon(Icons.satellite),
              title:Text("我不配"),
            ),
            ListTile(
              leading:Icon(Icons.schedule),
              title:Text("配几把")
            )
          ]
        ),
      ),
      body:tabsList[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message),title:Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.people),title:Text("联系人")),
          BottomNavigationBarItem(icon: Icon(Icons.polymer),title:Text("动态")),
        ],
        onTap: (value){
          setState(() {
            if(value==0){title="消息";}
            else if(value==1){title="联系人";}
            else{title="动态";}
            index=value;
          });
        },
        currentIndex: index),
    );
  }
}

class Leading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon:CircleAvatar(
          backgroundImage: NetworkImage("https://c-ssl.duitang.com/uploads/item/201803/19/20180319132911_UxCLe.jpeg"),
        ), 
        onPressed:(){
          print("点击");
          Scaffold.of(context).openDrawer();
        }
      );
  }
}
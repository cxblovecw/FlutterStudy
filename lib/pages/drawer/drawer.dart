import 'package:FlutterStudy/pages/drawer/components/drawer-content.dart';
import 'package:FlutterStudy/pages/drawer/components/drawer-footer.dart';
import 'package:FlutterStudy/pages/drawer/components/drawer-header.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: Container(
         padding: EdgeInsets.zero,
         child:Column(
           children:[
            MyDrawerHeader(),
            MyDrawerContent(),
            MyDrawerFooter()
           ]
         )
       ),
      );
  }
}
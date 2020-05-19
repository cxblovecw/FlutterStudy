import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(left:20),
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589909832853&di=7402afd6ba479851adb885ded95929cf&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fe%2F512353ca9630c.jpg"),fit: BoxFit.fitWidth)
              ),
              child:Row(
                mainAxisSize:MainAxisSize.max,
                children:[
                  Expanded(
                    child:Container(
                      padding: EdgeInsets.only(top:15,right: 15),
                      // color: Colors.red,
                      child: Container(
                        width: 60.0,
                        height:80.0,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(40.0),
                          image: DecorationImage(image: NetworkImage("https://c-ssl.duitang.com/uploads/item/201803/19/20180319132911_UxCLe.jpeg"),fit:BoxFit.cover)
                        ),
                      )
                    ),flex: 6,),
                  Expanded(child:Container(
                    height: 80.0,
                    // color:Colors.yellow,
                    child: Container(
                      padding: EdgeInsets.only(top:20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("我的名称",style: TextStyle(height: 2,fontWeight: FontWeight.w600,color: Colors.white),),
                          Text("个性签名............",maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(height: 2,fontWeight: FontWeight.w600,color: Colors.white))
                        ]
                      ),
                    ),
                  ),flex: 10,),
                  Expanded(child:Container(
                    // color:Colors.green,
                    child: Container(
                      padding:EdgeInsets.only(top:20,right: 5),
                      child:IconButton(icon: Icon(Icons.wallpaper,color: Colors.white,), onPressed: (){
                        print("我的二维码");
                      })
                    ),
                  ),flex: 3,),
                ]
              )
            );
  }
}
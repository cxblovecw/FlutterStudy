import 'package:FlutterStudy/tabs.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int account;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: EdgeInsets.fromLTRB(30, 120, 30, 0),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            Icon(Icons.android,size: 50,color: Colors.green,),
            Container(width: 10),
            Text("Login",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
          ],),
          Container(height: 80,),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.close)
            ),
            onChanged: (value){
              setState(() {
                account=int.parse(value);
              });
            },
          ),
          TextField(
            obscureText: true,
            onChanged: (value){
              setState(() {
                password=value;
              });
            },
          ),
          Container(height: 30),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:Colors.blue,
            ),
            child: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.white), onPressed: (){
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context){
                return Tabs();
              }),(route)=>route==null);
            }),
          ),
          Expanded(child: Container()),
          Row(
            children: <Widget>[
              Expanded(child:Container(
                child: Text("忘记密码",textAlign: TextAlign.center),
              )),
              Text("|"),
              Expanded(child:Container(
                child: Text("用户注册",textAlign: TextAlign.center,),
              )),
            ],
          ),
          Container(height: 10,)
       ],
     ), 
    ),
    );
  }
}
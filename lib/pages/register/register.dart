
import 'package:FlutterStudy/tabs.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String phone="";
  String password="";
  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(children: <Widget>[
        Container(height: 20,),
        Row(
          children:<Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
            Navigator.pop(context);
            },)]
          ,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(40, 50, 40, 0),
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                Icon(Icons.android,size: 50,color: Colors.green,),
                Container(width: 10),
                Text("Register",textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
              ],),
              Container(height: 50,),
              Container(
            padding: EdgeInsets.fromLTRB(0, 5,0, 5),  
            decoration: BoxDecoration(
              color: Color.fromRGBO(200,200,200,0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              enableInteractiveSelection: false,
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text:phone,
                  selection: new TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,offset: phone.length)))
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close,color: Colors.grey),
                  onPressed: (){
                    setState(() {
                      phone="";
                    });
                  },
                ),
                border: InputBorder.none,
            ),
            onChanged: (value){
              setState(() {
                phone=value;
              });
            },
          ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.fromLTRB(0, 5,0, 5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(200,200,200,0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              enableInteractiveSelection: false,
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text:password,
                  selection: new TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,offset: password.length)))
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(passwordVisible?Icons.visibility:Icons.visibility_off,color: Colors.grey),
                  onPressed: (){
                    setState(() {
                      passwordVisible=!passwordVisible;
                    });
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close,color: Colors.grey),
                  onPressed: (){
                    setState(() {
                      password="";
                    });
                  },
                ),
                border: InputBorder.none,
            ),
            onChanged: (value){
              setState(() {
                password=value;
              });
            },
          ),
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
       ],
     ), 
    )
      ],),
    );
  }
}
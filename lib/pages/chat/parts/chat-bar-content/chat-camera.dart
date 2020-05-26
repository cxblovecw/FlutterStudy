part of '../chat-bar/chat-bar.dart';

openCamera(){
  ImagePicker.pickImage(source: ImageSource.camera).then((value)=>{
    print(value)
  });
}
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

Future getImages() async{
  print("图片");
  // List<Asset> images = List<Asset>();
  // List<Asset> resultList;
  String error;
  try {
      MultiImagePicker.pickImages(
        maxImages: 10,
      ).then((value) =>{
        print(value)

      });
    } on Exception catch (e) {
      error = e.toString();
      print(error);
    }
}
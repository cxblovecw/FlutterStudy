import 'package:image_picker/image_picker.dart';

openCamera(){
  ImagePicker.pickImage(source: ImageSource.camera).then((value)=>{
    print(value)
  });
}
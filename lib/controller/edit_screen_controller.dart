import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditScreenController extends GetxController{

  var image = RxString('');
  pickImageFromGallery() async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
  image.value = pickedImage.path;
  }
  }





}
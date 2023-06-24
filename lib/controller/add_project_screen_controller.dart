import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProjectScreenController extends GetxController{

  Rx<File?> selectedImage = Rx<File?>(null);

  XFile? chooseImage;

  chooseImageFromGallery() async {
    ImagePicker _picker = ImagePicker();
    chooseImage = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    //   selectedImage.value = File(pickedFile.path);
    // } else {
    //   Get.snackbar(
    //     'Alert',
    //     'No image selected',
    //     backgroundColor: AppColorResources.buttonColorBlue,
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // }
    update();
  }
}
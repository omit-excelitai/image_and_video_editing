import 'package:get/get.dart';
import 'package:image_and_video_editing/utils/app_color_resources.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class HomeScreenController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar(
        'Alert',
        'No image selected',
        backgroundColor: AppColorResources.buttonColorBlue,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

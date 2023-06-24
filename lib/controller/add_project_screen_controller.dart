import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../view/screen/edit_screen.dart';

class AddProjectScreenController extends GetxController {
  // Rx<File?> selectedImage = Rx<File?>(null);
  //
  // XFile? chooseImage;
  //
  // chooseImageFromGallery() async {
  //   ImagePicker _picker = ImagePicker();
  //   chooseImage = await _picker.pickImage(source: ImageSource.gallery);
  //   update();
  // }
  //
  // Future<void> pickImageFromGallery() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   // if (pickedFile != null) {
  //   //   selectedImage.value = File(pickedFile.path);
  //   // } else {
  //   //   Get.snackbar(
  //   //     'Alert',
  //   //     'No image selected',
  //   //     backgroundColor: AppColorResources.buttonColorBlue,
  //   //     snackPosition: SnackPosition.BOTTOM,
  //   //   );
  //   // }
  //   update();
  // }

  // var chooseImage = RxString('');
  //
  // pickImageFromGallery() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     chooseImage.value = pickedImage.path;
  //   }
  // }

  final ImagePicker picker = ImagePicker();
  //final List<XFile> medias;
  VideoPlayerController? videoPlayerController;
  VideoPlayerController? toBeDisposed;

  /// For Pick Image and Video
  pickImageOrVideo() async {
    final XFile? media = await picker.pickMedia();
    final mediaPath = File(media!.path);
    if (mediaPath != null) {
      await Get.to(() => EditScreen(file: mediaPath));
    }
  }

  /// Dispose Video Controller
  Future<void> disposeVideoController() async {
    if (toBeDisposed != null) {
      await toBeDisposed!.dispose();
    }
    toBeDisposed = videoPlayerController;
    videoPlayerController = null;
  }

  /// For Play Video
  Future<void> playVideo(XFile? file) async {
    if (file != null) {
      await disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      videoPlayerController = controller;
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      update();
    }
  }


  // Widget buildInlineVideoPlayer(int index) {
  //   final VideoPlayerController controller =
  //   VideoPlayerController.file(File(file.path));
  //   const double volume = kIsWeb ? 0.0 : 1.0;
  //   controller.setVolume(volume);
  //   controller.initialize();
  //   controller.setLooping(true);
  //   controller.play();
  //   return Center(child: AspectRatioVideo(controller));
  // }
}

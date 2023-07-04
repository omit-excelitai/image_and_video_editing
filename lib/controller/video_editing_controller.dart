import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoEditingController extends GetxController {
  VideoPlayerController? videoController;
  ImagePicker picker = ImagePicker();
  dynamic pickImage;
  dynamic pickedFileX;


  /// For Pick Image or Video
  pickImageOrVideo() async {
    final pickedFile = await picker.pickMedia();
    pickedFileX = pickedFile!.path;
    if (pickedFile != null) {
      if (pickedFile.path.endsWith('.jpg') ||
          pickedFile.path.endsWith('.jpeg') ||
          pickedFile.path.endsWith('.png')) {
        pickImage = Image.file(File(pickedFile.path));
        update();
      } else if (pickedFile.path.endsWith('.mp4') ||
          pickedFile.path.endsWith('.mov')) {
        videoController = VideoPlayerController.file(File(pickedFile.path));
        await videoController!.initialize();
        videoController!.setLooping(true);
        videoController!.play();
        update();
      }
    } else {
      return null;
    }
  }


  /// For Trim Video
  void trimVideo(Duration start, Duration end) {
    // Perform the trimming operation using the start and end durations
    // Example implementation: videoController.trim(start, end);
  }

  @override
  void onClose() {
    videoController!.dispose();
    super.onClose();
  }
}
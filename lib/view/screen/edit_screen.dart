import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_and_video_editing/controller/video_editing_controller.dart';
import 'package:image_and_video_editing/utils/app_color_resources.dart';
import 'package:video_player/video_player.dart';

class EditScreen extends StatelessWidget {
  final File? file;
  static const String routeName = '/edit_screen';
  EditScreen({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorResources.scaffoldBgColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GetBuilder<VideoEditingController>(
            init: VideoEditingController(),
            builder: (controller) {
              final videoController = controller.videoController;
              final pickImage = controller.pickImage;
              print('check image path -----------$pickImage');
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    videoController != null
                        ? AspectRatio(
                            aspectRatio: videoController.value.aspectRatio,
                            child: VideoPlayer(videoController),
                          )
                        : pickImage != null
                            ? Container(
                                child: pickImage,
                              )
                            : SizedBox.shrink(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

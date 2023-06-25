import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../controller/video_editing_controller.dart';

class VideoEditingScreen extends StatelessWidget {
  final VideoEditingController controller = Get.put(VideoEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Editing')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.pickImageOrVideo,
                child: Text('Pick Video'),
              ),
              GetBuilder<VideoEditingController>(
                  init: VideoEditingController(),
                  builder: (controller) {
                    final videoController = controller.videoController;
                    final pickImage = controller.pickImage;
                    print('check image path -----------$pickImage');
                    // if (pickImage == null || videoController == null) {
                    //   return Container();
                    // } else {
                    //   print('check image path -----------$pickImage');
                    //   print('check image path -----------$pickImage');
                    //   print('check image path -----------$pickImage');
                    //   print('check image path -----------$pickImage');
                    //
                    // }
                    return videoController != null
                        ? AspectRatio(
                            aspectRatio: videoController.value.aspectRatio,
                            child: VideoPlayer(videoController),
                          )
                        : pickImage != null
                            ? Container(
                                child: pickImage,
                              )
                            : SizedBox.shrink();
                  }),
              ElevatedButton(
                onPressed: () {
                  // Example trimming operation: Trim from 5s to 10s
                  controller.trimVideo(
                      Duration(seconds: 5), Duration(seconds: 10));
                },
                child: Text('Trim Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

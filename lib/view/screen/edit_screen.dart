import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_and_video_editing/controller/video_editing_controller.dart';
import 'package:image_and_video_editing/utils/app_color_resources.dart';
import 'package:image_and_video_editing/view/widgets/reusable_app_bar.dart';
import 'package:video_player/video_player.dart';

import '../widgets/bottom_navbar_widget.dart';
import '../widgets/reusable_editor_button.dart';

class EditScreen extends StatefulWidget {
  final File? file;
  static const String routeName = '/edit_screen';
  EditScreen({Key? key, this.file}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Source source = AssetSource('audios/audio.mp3');

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else if (state == PlayerState.paused ||
          state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    super.initState();
  }

  playMusic() async {
    audioPlayer.play(
      source,
      position: Duration(milliseconds: 2500),
      mode: PlayerMode.mediaPlayer,
    );
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorResources.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: AppColorResources.primaryBlack,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: ReusableEditorButton(
          onTap: () {
            Get.back();
          },
          icon: Icons.arrow_back_outlined,
          decoration: BoxDecoration(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableEditorButton(
              onTap: () {},
              icon: Icons.undo_outlined,
              decoration: BoxDecoration(),
            ),
            SizedBox(
              width: 30.w,
            ),
            ReusableEditorButton(
              onTap: () {},
              icon: Icons.redo_outlined,
              decoration: BoxDecoration(),
            ),
          ],
        ),
        actions: [
          ReusableEditorButton(
            onTap: () {},
            icon: Icons.save_alt_outlined,
            decoration: BoxDecoration(),
          ),
        ],
      ),

      /// Body
      body: GetBuilder<VideoEditingController>(
          init: VideoEditingController(),
          builder: (controller) {
            final videoController = controller.videoController;
            final pickImage = controller.pickImage;
            print('check image path -----------$pickImage');

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: videoController != null
                                ? AspectRatio(
                                    aspectRatio: videoController.value.aspectRatio,
                                    child: VideoPlayer(videoController),
                                  )
                                : pickImage != null
                                    ? Container(
                                        child: pickImage,
                                      )
                                    : SizedBox.shrink(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          IconButton(
                            icon: isPlaying
                                ? Icon(Icons.pause)
                                : Icon(Icons.play_arrow),
                            onPressed: () {
                              if (isPlaying) {
                                pauseAudio();
                              } else {
                                playMusic();
                              }
                            },
                            iconSize: 50.0,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Footer
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    color: AppColorResources.primaryBlack,
                    //height: 65.h,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.text_fields,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.music_note_sharp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.filter,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.rotate_left_outlined,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.rotate_right_outlined,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.adjust,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.crop,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ReusableEditorButton(
                            onTap: () {},
                            icon: Icons.emoji_emotions_outlined,
                          ),

                          // BottomNavBarWidget(iconData: Icons.text_fields,onTap: (){
                          // },),
                          // BottomNavBarWidget(iconData: Icons.music_note_sharp,onTap: (){
                          //
                          // },),
                          // BottomNavBarWidget(iconData: Icons.filter,onTap: (){},),
                          // BottomNavBarWidget(iconData: Icons.adjust,onTap: (){},),
                          // BottomNavBarWidget(iconData: Icons.emoji_emotions,onTap: (){},),
                          // BottomNavBarWidget(iconData: Icons.music_note_sharp,onTap: (){},),
                          // BottomNavBarWidget(iconData: Icons.filter,onTap: (){},),
                          // BottomNavBarWidget(iconData: Icons.adjust,onTap: (){},),
                          // BottomNavBarWidget(iconData: Icons.emoji_emotions,onTap: (){},),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// class EditScreen extends StatefulWidget {
//   final File? file;
//   static const String routeName = '/edit_screen';
//   EditScreen({Key? key, this.file}) : super(key: key);
//
//   @override
//   _EditScreenState createState() => _EditScreenState();
// }
//
// class _EditScreenState extends State<EditScreen> {
//   int selectedContainerIndex = -1; // Index of the selected container
//   List<Color> containerColors = List.filled(2, Colors.transparent); // List to hold container colors
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColorResources.scaffoldBgColor,
//       body: GetBuilder<VideoEditingController>(
//         init: VideoEditingController(),
//         builder: (controller) {
//           final videoController = controller.videoController;
//           final pickImage = controller.pickImage;
//           print('check image path -----------$pickImage');
//
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Expanded(
//                 child: Container(
//                   child: videoController != null
//                       ? AspectRatio(
//                     aspectRatio: videoController.value.aspectRatio,
//                     child: VideoPlayer(videoController),
//                   )
//                       : pickImage != null
//                       ? Container(
//                     child: pickImage,
//                   )
//                       : SizedBox.shrink(),
//                 ),
//               ),
//               Container(
//                 color: Colors.black87,
//                 height: 65,
//                 width: double.infinity,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       BottomNavBarWidget(
//                         iconData: Icons.text_fields,
//                         onTap: () {
//                           updateSelectedContainer(0);
//                         },
//                         onColorChange: (color) {
//                           setState(() {
//                             containerColors[0] = color; // Update the container color
//                           });
//                         },
//                         index: 0, onSelectionChange: (int value) {  },
//                       ),
//                       BottomNavBarWidget(
//                         iconData: Icons.music_note_sharp,
//                         onTap: () {
//                           updateSelectedContainer(1);
//                         },
//                         onColorChange: (color) {
//                           setState(() {
//                             containerColors[1] = color; // Update the container color
//                           });
//                         },
//                         index: 1, onSelectionChange: (int value) {  },
//                       ),
//                       // Add other BottomNavBarWidget items with their own onTap and onColorChange callbacks
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   void updateSelectedContainer(int index) {
//     if (selectedContainerIndex == index) {
//       setState(() {
//         selectedContainerIndex = -1; // Deselect the container
//       });
//     } else {
//       setState(() {
//         selectedContainerIndex = index; // Update the selected container index
//       });
//     }
//
//     // Reset container colors
//     setState(() {
//       containerColors = List.filled(containerColors.length, Colors.transparent);
//     });
//
//     // Update the color of the selected container
//     if (selectedContainerIndex != -1) {
//       setState(() {
//         containerColors[selectedContainerIndex] = Colors.blue;
//       });
//     }
//   }
// }

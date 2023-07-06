import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_and_video_editing/controller/video_editing_controller.dart';
import 'package:image_and_video_editing/utils/app_color_resources.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:video_player/video_player.dart';
import '../widgets/reusable_editor_button.dart';
import 'package:flutter/foundation.dart' as foundation;

class EditScreen extends StatefulWidget {
  final File? file;
  static const String routeName = '/edit_screen';
  EditScreen({Key? key, this.file}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  CroppedFile? _croppedFile;

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Source source = AssetSource('audios/audio.mp3');
  double rotationAngle = 0.0;

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

  /// For Play Music
  playMusic() async {
    audioPlayer.play(
      source,
      position: Duration(milliseconds: 2500),
      mode: PlayerMode.mediaPlayer,
    );
  }

  /// For Pause Audio
  pauseAudio() async {
    await audioPlayer.pause();
  }

  /// For Stop Audio
  stopAudio() async {
    await audioPlayer.stop();
  }

  /// For Rotate Image or Video
  rotateRightAngle() {
    setState(() {
      rotationAngle += pi / 2;
    });
  }

  rotateLeftAngle() {
    setState(() {
      rotationAngle -= pi / 2;
    });
  }

  final videoEditingController = Get.find<VideoEditingController>();

  /// crop image
  croppedImage() async {
    if (videoEditingController.pickedFileX != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: videoEditingController.pickedFileX,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }








  ///.......emoji...............................

  // void openEmojiPicker() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return EmojiPicker(
  //         onEmojiSelected: (Category? category, Emoji emoji) {
  //           setState(() {
  //             videoEditingController.selectedEmojis.add(emoji.emoji);
  //             Navigator.pop(context); // Close the emoji picker
  //           });
  //         },
  //
  //       );
  //     },
  //   );
  // }

  void openEmojiPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EmojiPicker(
          onEmojiSelected: (Category? category, Emoji emoji) {
            setState(() {
              videoEditingController.selectedEmojis.add(emoji.emoji);
              videoEditingController..emojiPositions.add(Offset(0, 0)); // Initial position
              Navigator.pop(context); // Close the emoji picker
            });
          },
        );
      },
    );
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
          print('check image path -----------${controller.pickedFileX}');


          return SingleChildScrollView(
            child: Container(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Transform.rotate(
                      angle: rotationAngle,
                      child: Container(
                        child: videoController != null
                            ? AspectRatio(
                          aspectRatio: 16 / 9, // Replace with the desired aspect ratio
                          child: Container(
                            child: VideoPlayer(videoController),
                          ),
                        )
                            : controller.pickImage != null
                            ? GestureDetector(
                          // Wrap the Stack with GestureDetector
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              controller.pickImage,
                              Stack(
                                children: [
                                  // Emojis positioned freely on the image
                                  for (int i = 0; i < controller.selectedEmojis.length; i++)
                                    Positioned(
                                      left: controller.emojiPositions[i].dx,
                                      top: controller.emojiPositions[i].dy,
                                      child: Draggable(
                                        onDraggableCanceled: (_, offset) {
                                          // Update emoji position based on drag
                                          // controller.emojiPositions[i] = offset; // Remove this line
                                        },
                                        onDragUpdate: (details) {
                                          // Update emoji position continuously while dragging
                                          setState(() {
                                            controller.emojiPositions[i] += details.delta;
                                          });
                                        },
                                        child: Text(
                                          controller.selectedEmojis[i],
                                          style: TextStyle(fontSize: 50),
                                        ),
                                        feedback: Text(
                                          controller.selectedEmojis[i],
                                          style: TextStyle(fontSize: 50, color: Colors.transparent),
                                        ),
                                        childWhenDragging: Container(),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        )
                            : SizedBox.shrink(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
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
          );

        }),

        ///......multipule emoji select...
        // builder: (controller) {
        //   final videoController = controller.videoController;
        //   print('check image path -----------${controller.pickedFileX}');
        //
        //   return SingleChildScrollView(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Transform.rotate(
        //           angle: rotationAngle,
        //           child: Container(
        //             child: videoController != null
        //                 ? AspectRatio(
        //               aspectRatio: videoController.value.aspectRatio,
        //               child: VideoPlayer(videoController),
        //             )
        //                 : controller.pickImage != null
        //                 ? Stack(
        //               alignment: Alignment.center,
        //               children: [
        //                 controller.pickImage,
        //                 Column(
        //                   children: controller.selectedEmojis.map((emoji) {
        //                     return Text(
        //                       emoji,
        //                       style: TextStyle(fontSize: 50),
        //                     );
        //                   }).toList(),
        //                 ),
        //               ],
        //             )
        //                 : SizedBox.shrink(),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         IconButton(
        //           icon: isPlaying
        //               ? Icon(Icons.pause)
        //               : Icon(Icons.play_arrow),
        //           onPressed: () {
        //             if (isPlaying) {
        //               pauseAudio();
        //             } else {
        //               playMusic();
        //             }
        //           },
        //           iconSize: 50.0,
        //           color: Colors.blue,
        //         ),
        //       ],
        //     ),
        //   );
        // }),




        // old code
        // builder: (controller) {
        //     final videoController = controller.videoController;
        //     final pickImage = controller.pickImage;
        //     print('check image path -----------$pickImage');
        //
        //     return SingleChildScrollView(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Transform.rotate(
        //             angle: rotationAngle,
        //             child: Container(
        //               child: videoController != null
        //                   ? AspectRatio(
        //                       aspectRatio: videoController.value.aspectRatio,
        //                       child: VideoPlayer(videoController),
        //                     )
        //                   : pickImage != null
        //                       ? Container(
        //                           child: pickImage,
        //                         )
        //                       : SizedBox.shrink(),
        //             ),
        //           ),
        //           SizedBox(
        //             height: 10.h,
        //           ),
        //           IconButton(
        //             icon:
        //                 isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        //             onPressed: () {
        //               if (isPlaying) {
        //                 pauseAudio();
        //               } else {
        //                 playMusic();
        //               }
        //             },
        //             iconSize: 50.0,
        //             color: Colors.blue,
        //           ),
        //         ],
        //       ),
        //     );
        //   }),



      /// Footer
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                onTap: () {
                  rotateLeftAngle();
                },
                icon: Icons.rotate_left_outlined,
              ),
              SizedBox(
                width: 10.w,
              ),
              ReusableEditorButton(
                onTap: () {
                  rotateRightAngle();
                },
                icon: Icons.rotate_right_outlined,
              ),
              SizedBox(
                width: 10.w,
              ),
              ReusableEditorButton(
                onTap: () {
                  croppedImage();
                },
                icon: Icons.crop,
              ),
              SizedBox(
                width: 10.w,
              ),
              ReusableEditorButton(
                onTap: () {},
                icon: Icons.brush_outlined,
              ),
              SizedBox(
                width: 10.w,
              ),
              ReusableEditorButton(
                onTap: () {},
                icon: Icons.color_lens_outlined,
              ),
              SizedBox(
                width: 10.w,
              ),
              ReusableEditorButton(
                onTap: () {},
                icon: Icons.adjust,
              ),






              //............................ emoji...................
              SizedBox(
                width: 10.w,
              ),
              ReusableEditorButton(
                onTap: () {
                  openEmojiPicker();
                },
                icon: Icons.emoji_emotions_outlined,
              ),

            ],
          ),
        ),
      ),
    );
  }
}



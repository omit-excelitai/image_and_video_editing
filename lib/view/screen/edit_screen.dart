import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_and_video_editing/controller/add_project_screen_controller.dart';

class EditScreen extends StatelessWidget {
  final File? file;
  static const String routeName = '/edit_screen';
  EditScreen({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GetBuilder<AddProjectScreenController>(
            init: AddProjectScreenController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(file!),
                ],
              );
            }),
      ),
    );
  }
}

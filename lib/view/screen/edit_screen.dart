import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatelessWidget {
  final String? imageFile;
  static const String routeName = '/edit_screen';
  EditScreen({Key? key, this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(File(imageFile!)),
          ],
        ),
      ),
    );
  }
}

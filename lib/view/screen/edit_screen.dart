import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatelessWidget {
  XFile imageFile;
  static const String routeName = '/edit_screen';
  EditScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(File(imageFile.path)),
      ),
    );
  }
}

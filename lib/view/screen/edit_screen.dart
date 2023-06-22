

import 'dart:io';

import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {

  final File imageFile;
  static const String routeName = '/edit_screen';
  const EditScreen({Key? key,required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_and_video_editing/view/screen/add_screen.dart';
import 'package:image_and_video_editing/view/screen/view_screen.dart';

import '../view/screen/home_screen.dart';


class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<String> titles = ['Home', 'Add', 'View'];
  List<Widget> screens = [
    HomeScreen(),
    AddScreen(),
    ViewScreen()
  ];

  String get title => titles[selectedIndex];
  Widget get currentScreen => screens[selectedIndex];

  void changeScreen(int index) {
    selectedIndex = index;
    update();
  }
}
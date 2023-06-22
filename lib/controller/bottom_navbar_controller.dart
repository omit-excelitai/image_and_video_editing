
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_and_video_editing/view/screen/add_project_screen.dart';
import 'package:image_and_video_editing/view/screen/view_screen.dart';
import '../view/screen/home_screen.dart';


class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<String> titles = ['Add New Project', 'Home', 'View Videos'];
  List<Widget> screens = [
    AddProjectScreen(),
    HomeScreen(),
    ViewScreen()
  ];

  String get title => titles[selectedIndex];
  Widget get currentScreen => screens[selectedIndex];

  void changeScreen(int index) {
    selectedIndex = index;
    update();
  }
}
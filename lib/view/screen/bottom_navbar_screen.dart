import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_and_video_editing/utils/app_color_resources.dart';
import '../../controller/bottom_navbar_controller.dart';

class BottomNavBarScreen extends StatelessWidget {
  static const String routeName = '/bottom_navbar';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.title,
            style: TextStyle(color: AppColorResources.primaryBlack),
          ),
        ),
        body: controller.currentScreen,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColorResources.enableSwitchColor,
          isExtended: true,
          child: Icon(Icons.add_circle_outline_outlined,
              color: AppColorResources.primaryBlack),
          onPressed: () {
            controller.changeScreen(0);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          height: 70.h,
          color: AppColorResources.appDrawerColor.withOpacity(0.6),
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: AppColorResources.primaryWhite,
                ),
                onPressed: () => controller.changeScreen(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.view_agenda_outlined,
                  color: AppColorResources.primaryGreen,
                ),
                onPressed: () => controller.changeScreen(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

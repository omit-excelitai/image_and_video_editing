import 'package:flutter/material.dart';
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
          title: Text(controller.title,style: TextStyle(
            color: Colors.white
          ),),
        ),
        body: controller.currentScreen,
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          //backgroundColor: AppColorResources.primaryOrange,
          child: Icon(Icons.add_circle_outline_outlined, color: AppColorResources.primaryBlack),
          onPressed: () {
            controller.changeScreen(0);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          //color: AppColorResources.borderColor,
          notchMargin: 5,
          shape: CircularNotchedRectangle(
          ),
          child: Container(
            height: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: AppColorResources.primaryBlack,),
                  onPressed: () => controller.changeScreen(1),
                ),
                IconButton(
                  icon: Icon(Icons.view_agenda_outlined,color: AppColorResources.primaryGreen,),
                  onPressed: () => controller.changeScreen(2),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}

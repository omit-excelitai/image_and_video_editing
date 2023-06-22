import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        bottomNavigationBar: BottomAppBar(
          notchMargin: 50,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.language,),
                  onPressed: () => controller.changeScreen(1),
                ),
                IconButton(
                  icon: Icon(Icons.translate,color: Colors.green,),
                  onPressed: () => controller.changeScreen(2),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          // backgroundColor: AppColor.appPrimaryColor,
          child: Icon(Icons.home,color: Colors.white,),
          onPressed: () {
            controller.changeScreen(0);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

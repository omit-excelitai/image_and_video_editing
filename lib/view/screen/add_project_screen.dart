
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home_screen_controller.dart';
import '../../utils/app_color_resources.dart';

class AddProjectScreen extends StatelessWidget {
  static const String routeName = '/add_project_screen';
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorResources.scaffoldBgColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.w),
          child: Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFd3f3f1),
            ),
            child: GetBuilder<HomeScreenController>(
              init: HomeScreenController(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: controller.pickImageFromGallery,
                      icon: Icon(Icons.add),
                    ),
                  ),
                  Text(
                    'Add files',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

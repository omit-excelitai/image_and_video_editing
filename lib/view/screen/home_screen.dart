import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_and_video_editing/controller/home_screen_controller.dart';
import '../../utils/app_color_resources.dart';
import 'edit_screen.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

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
                      onPressed:(){
                        controller.pickImageFromGallery();
                        if (controller.selectedImage.value != null) {
                          Get.to(EditScreen(imageFile: controller.selectedImage.value!));
                        }


                    },



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

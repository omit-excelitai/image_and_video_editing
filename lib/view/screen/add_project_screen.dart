import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_and_video_editing/view/screen/edit_screen.dart';
import '../../controller/add_project_screen_controller.dart';
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFd3f3f1),
                  ),
                  child: GetBuilder<AddProjectScreenController>(
                    init: AddProjectScreenController(),
                    builder: (controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              controller.chooseImageFromGallery().obs;
                              if (controller.chooseImage != null) {
                                Get.to(() => EditScreen(
                                    imageFile: controller.chooseImage!));
                                print(
                                    "Check ------- ${controller.selectedImage.value!}");
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

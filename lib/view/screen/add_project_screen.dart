import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_and_video_editing/utils/app_style.dart';
import 'package:image_and_video_editing/view/screen/edit_screen.dart';
import '../../controller/video_editing_controller.dart';
import '../../utils/app_color_resources.dart';
import '../widgets/reusable_app_bar.dart';

class AddProjectScreen extends StatelessWidget {
  static const String routeName = '/add_project_screen';
  const AddProjectScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorResources.scaffoldBgColor,
      appBar: ReusableAppBar(
        title: 'Add New Project',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<VideoEditingController>(
                    init: VideoEditingController(),
                    builder: (controller) {
                      return InkWell(
                        onTap: () async {
                          await controller.pickImageOrVideo();
                          final imagePath = controller.pickImage;
                          final videoPath = controller.videoController;
                          if (imagePath != null || videoPath != null) {
                            await Get.to(() => EditScreen());
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 3),
                                color: AppColorResources.buttonColor,
                                blurRadius: 3,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              colors: [Colors.purple, Colors.blueAccent],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.add),
                                backgroundColor:
                                    AppColorResources.enableSwitchColor,
                              ),
                              Text(
                                'Add New Project',
                                style: myStyleInter(
                                    16.sp,
                                    AppColorResources.primaryWhite,
                                    FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

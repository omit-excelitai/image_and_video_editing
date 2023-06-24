import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_color_resources.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorResources.scaffoldBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}

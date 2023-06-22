import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.w),
          child: Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red
            ),
          ),
        ),
      ),
    );
  }
}

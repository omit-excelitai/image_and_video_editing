import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarWidget extends StatelessWidget {
  IconData iconData;
  final VoidCallback onTap;
 BottomNavBarWidget({Key? key,required this.iconData, required this.onTap}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 40.h,
          width: 35.w,
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: IconButton(
            onPressed: onTap,
            icon: Icon(iconData),
          )),
    );
  }
}




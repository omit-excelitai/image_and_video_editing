import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_and_video_editing/utils/app_color_resources.dart';

class ReusableEditorButton extends StatelessWidget {
  ReusableEditorButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.color,
    this.decoration,
  });

  VoidCallback? onTap;
  IconData? icon;
  Color? color;
  Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        width: 40.w,
        decoration: decoration??BoxDecoration(border: Border.all(color: AppColorResources.primaryWhite, width: 1.w)),
        child: Icon(icon, color: color??AppColorResources.textFieldTextColor,),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_color_resources.dart';
import '../../utils/app_style.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? widget;

  ReusableAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColorResources.enableSwitchColor,
      title: Text(
        "$title",
        style: myStyleInter(
          18.sp,
          AppColorResources.buttonColor,
          FontWeight.w700,
        ),
      ),
      actions: actions??[],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

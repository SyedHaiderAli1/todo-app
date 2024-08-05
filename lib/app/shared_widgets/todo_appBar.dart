import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String title;
  final isBack;
  const TodoAppBar({super.key,this.bottom,required this.title,this.isBack=true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      leading:
      isBack?
      GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
              height: 50,
              width: 50,
              color: Colors.transparent,
              child: const Icon(CupertinoIcons.back, color: AppColors.white))): const SizedBox.shrink(),
      bottom: bottom,
      title: MyText(
        title: title,
        clr: AppColors.white,
        size: 16.5.sp,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

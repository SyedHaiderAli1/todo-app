import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/app/shared_widgets/custom_button.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:todoapp/app/utils/utils.dart';
import 'package:todoapp/widgets/button.dart';
import '../controllers/welcome_controller.dart';
import 'package:sizer/sizer.dart';


class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar:CustomButton(
        onPress: () {
          Get.toNamed(Routes.ADD_TODO);

          // Get.to(() => TodosScreen());
        },
        text: 'Get Started',
      ).paddingSymmetric(
        horizontal: 48,
        vertical: 24
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Utils.getImagePath('primary_logo'),scale: 4.5).paddingOnly(bottom: 10.h),
            Image.asset(Utils.getImagePath('todo'),scale: 4),

            Center(
              child: MyText(
                 title: "Welcome to Todo App",
                 clr: AppColors.primary,
                 weight: FontWeight.w800,
                size: 12.sp,
              ),
            ).paddingOnly(top: 8.h,bottom: 1.h),

            MyText(
              title: "TODO will helps you to stay organized and perform your task much faster",
              clr: AppColors.black.withOpacity(0.6),
              weight: FontWeight.w400,
              textAlign: TextAlign.center,
              size: 10.5.sp,
            ).paddingSymmetric(horizontal: 25.w),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:todoapp/app/utils/utils.dart';
import 'package:sizer/sizer.dart';

class CustomDialogBox {


  static void deleteDialogue(String title, VoidCallback onTap) {
    Get.dialog(
      Dialog(
        child: Container(
          height: 180,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "Delete Task",
                clr: AppColors.black,
                size: 10.sp,
                weight: FontWeight.w600,
              ),
              MyText(title: title,
                  clr: AppColors.black.withOpacity(0.7),
                  size: 11.sp, weight: FontWeight.w300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                width: 25.w,
                height: 40,
                decoration: BoxDecoration(

                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.9),
                      offset: const Offset(0, 10),
                      spreadRadius: 0,
                      blurRadius: 10,
                    ),
                  ],
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: MyText(
                        title: "Yes",
                        clr: AppColors.white,
                        size: 8.sp,
                        weight: FontWeight.w600,
                        ),
                  )).paddingOnly(right: 12),
              ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        width: 25.w,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.black
                          ),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.9),
                              offset: const Offset(0, 10),
                              spreadRadius: 0,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Center(
                          child: MyText(
                              title: "No",
                              clr: AppColors.black,
                              size: 8.sp,
                              weight: FontWeight.w600,
                              isUrbanist: false),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
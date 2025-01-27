import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/shared_widgets/custom_dialog.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:todoapp/app/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/presentation/todo/controllers/todo_controller.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (controller) {
        return  controller.done.isNotEmpty ?
         Container(
          color: AppColors.boxColor.withOpacity(0.03),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.done.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.toggleTodo(controller.done[index]);
                          },
                          child: Container(
                            width: 18,
                            height: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                                borderRadius: BorderRadius.circular(1),
                                border: Border.all(
                                    width: 2,
                                    color: AppColors.primary
                                )
                            ),
                            child: const Icon(Icons.done,color: AppColors.white,size: 12,weight: 12),
                          ).paddingOnly(right: 12),
                        ),
                        SizedBox(
                          width: 30.w,
                          child: MyText(
                            title: controller.done[index].title,
                            lineThrough: true,
                            overFLow: TextOverflow.ellipsis,
                            clr: AppColors.primary,
                            weight: FontWeight.w400,
                            size: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyText(
                          title:Utils.formatDate(controller.done[index].cdt),
                          clr: Colors.black,
                          size: 7.5.sp,
                          weight: FontWeight.w400,
                        ).paddingOnly(right: 12),
                        GestureDetector(
                            onTap: (){
                              log("Shahzaib");
                              CustomDialogBox.deleteDialogue('Do you want to delete this task..?', () async {
                              Get.back();
                               await  controller.deleteTodo(controller.done[index]);
                              });
                            },
                            child: Image.asset(Utils.getImagePath('delete'),height: 18,width: 16)),

                      ],
                    ),
                  ],
                ),
              ).paddingOnly(top: 12);
            },
          ),
        ).paddingSymmetric(horizontal: 27,vertical: 20):
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Utils.getImagePath('no_task'),scale: 4).paddingOnly(bottom: 4.h),
            MyText(
              title: 'Your task is empty, you have no list completed',
              clr: Colors.black,
              size: 14.sp,
              textAlign: TextAlign.center,
              weight: FontWeight.w400,
            ).paddingSymmetric(horizontal: 50)
          ],
        );
      }
    );
  }
}

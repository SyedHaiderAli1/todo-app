import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/app/shared_widgets/custom_dialog.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/app/utils/utils.dart';
import 'package:todoapp/presentation/todo/controllers/todo_controller.dart';

class RemainingTab extends StatelessWidget {
  const RemainingTab({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (controller) {
        return controller.remaining.value.isNotEmpty ?
          Container(
          color: AppColors.boxColor.withOpacity(0.03),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount:controller.remaining.length,
            itemBuilder: (context, index) {
              return
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.ADD_TODO,arguments: controller.remaining[index]);
                },
                child: Container(
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
                              controller.toggleTodo(controller.remaining[index]);
                            },
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                      width: 2,
                                      color: AppColors.primary
                                  )
                              ),
                            ).paddingOnly(right: 12),
                          ),
                          SizedBox(
                            width: 30.w,
                            child: MyText(
                              title: controller.remaining[index].title,
                              clr: Colors.black,
                              overFLow: TextOverflow.ellipsis,
                              weight: FontWeight.w400,
                              size: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyText(
                            title:Utils.formatDate(controller.remaining[index].cdt),
                            clr: Colors.black,
                            size: 7.5.sp,
                            weight: FontWeight.w400,
                          ).paddingOnly(right: 12),
                          GestureDetector(
                              onTap: (){
                                CustomDialogBox.deleteDialogue('Do you want to delete this task..?', () async {
                                  Get.back();
                                  await  controller.deleteTodo(controller.remaining[index]);
                                });
                              },
                              child: Image.asset(Utils.getImagePath('delete'),height: 18,width: 16)),

                        ],
                      ),
                    ],
                  ),
                ).paddingOnly(top: 12),
              );

            },
          ),
        ).paddingSymmetric(horizontal: 27,vertical: 20):
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Utils.getImagePath('no_task'),scale: 4).paddingOnly(bottom: 4.h),
              MyText(
                title: 'Your task is empty, you have no list Todo',
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

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/shared_widgets/custom_button.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:todoapp/app/shared_widgets/text_field.dart';
import 'package:todoapp/app/shared_widgets/todo_appBar.dart';
import 'package:todoapp/app/utils/utils.dart';
import 'package:todoapp/models/todo.dart';
import 'package:sizer/sizer.dart';
import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTodoController>(
      init: AddTodoController(),
      builder: (context) {
        return Scaffold(
          appBar: const TodoAppBar(title: 'Add Todo'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 132,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                      gradient:  LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0.2),
                        ],
                      ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.34),
                        offset: const Offset(-2, 10),
                        blurRadius: 11,
                        spreadRadius: 0
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: "Manage your \n time well",
                        clr: AppColors.white,
                        size: 18.sp,
                        weight: FontWeight.w400,
                      ),
                      Image.asset(Utils.getImagePath('time'),scale: 4)
                    ],
                  ).paddingOnly(left: 16,right: 28),
                ).paddingOnly(bottom: 5.h),


                CustomTextFormField(
                  focus: controller.titleFocus,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  borderRadius: BorderRadius.circular(5),
                  controller: controller.titleController,
                  height: 50.0,
                  hintText: "Enter todo title",
                ),
                CustomTextFormField(
                  padding: const EdgeInsets.fromLTRB(25, 10, 10,10),
                  focus: controller.descriptioinFocus,
                  borderRadius: BorderRadius.circular(5),
                  controller: controller.descriptionController,
                  hintText: "Enter description",
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: "Submit",
                  onPress:() async {
                    if (controller.titleController.text.isEmpty || controller.descriptionController.text.isEmpty) return;
                    var todo = Todo(
                      id:controller.todo!=null ?  controller.todo!.id  : UniqueKey().toString(),
                      title: controller.titleController.text,
                      description: controller.descriptionController.text,
                      cdt: DateTime.now(),
                    );
                    controller.titleController.text = '';
                    controller.descriptionController.text = '';
                   if(controller.todo!=null){
                     await controller.updateTodo(todo);
                   } else{
                     await controller.addTodo(todo);
                   }
                  },
                ).paddingSymmetric(horizontal: 40),
                const SizedBox(height: 10),
              ],
            ).paddingSymmetric(horizontal: 22,vertical: 5.h),
          ),
        );
      }
    );
  }
}

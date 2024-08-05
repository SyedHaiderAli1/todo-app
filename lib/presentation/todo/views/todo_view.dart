import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:todoapp/app/shared_widgets/todo_appBar.dart';
import 'package:todoapp/app/shared_widgets/view_todo_screen.dart';
import 'package:todoapp/app/utils/utils.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/presentation/todo/views/completed_tab.dart';
import 'package:todoapp/presentation/todo/views/remaining_tab.dart';
import 'package:todoapp/presentation/todo/widgets/build_section.dart';
import 'package:todoapp/presentation/todo/widgets/todo_card.dart';
import '../controllers/todo_controller.dart';
import 'package:sizer/sizer.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
     init: TodoController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primary,
            icon: const Icon(Icons.add,color: AppColors.white),
            onPressed: () {
              Get.offNamed(Routes.ADD_TODO);
            },
            label: const MyText(title:  'Add Todo',clr: AppColors.white),
          ),
          appBar: const TodoAppBar(title: 'Todo'),

          body: Column(
            children: [
              SizedBox(height: 5.h),
              Container(
                color: AppColors.grey,
                height: 52,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: AppColors.white,
                  indicator: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                    ),
                  ),
                  unselectedLabelColor: AppColors.black,
                  labelColor: AppColors.white,
                  tabs: const [
                    Tab(text: 'Remaining'),
                    Tab(text: 'Completed'),
                  ],
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: const [
                    RemainingTab(),
                    CompletedTab()
                  ],
                ),
              ),
            ],
          ),


          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SizedBox(height: 20),
          //     buildSection(
          //       title: "Completed",
          //       child: ListView.builder(
          //         padding: EdgeInsets.zero,
          //         itemCount: controller.done.length,
          //         itemBuilder: (context, index) {
          //           Todo todo = controller.done[index];
          //           return GestureDetector(
          //             onTap: () {
          //               Get.to(() => ViewTodoScreen(todo: todo));
          //             },
          //             onLongPress: () {
          //               controller.toggleTodo(todo);
          //             },
          //             child: TodoCard(
          //               isDone: todo.isDone,
          //               title: todo.title,
          //               date: todo.cdt,
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     buildSection(
          //       child: ListView.builder(
          //         itemCount: controller.remaining.length,
          //         itemBuilder: (context, index) {
          //           Todo todo = controller.remaining[index];
          //           return GestureDetector(
          //             onLongPress: () {
          //               log("Shahzaib");
          //               controller.toggleTodo(todo);
          //             },
          //             child: TodoCard(
          //               isDone: todo.isDone,
          //               title: todo.title,
          //               date: todo.cdt,
          //             ),
          //           );
          //         },
          //       ),
          //       title: "Remaining",
          //     ),
          //   ],
          // ),
        );
      }
    );
  }

  Widget _buildTodoList(List<String> todos) {
    return Container(
      color: AppColors.boxColor.withOpacity(0.03),
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          log('----------Todos----------${todos.length.toString()}');
          return todos.isNotEmpty ?
            GestureDetector(
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
                      Container(
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
                      MyText(
                        title: todos[index],
                        clr: Colors.black,
                        weight: FontWeight.w400,
                        size: 14.sp,
                      ),


                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                        title: '9 Min ago',
                        clr: Colors.black,
                        size: 7.5.sp,
                        weight: FontWeight.w400,
                      ).paddingOnly(right: 12),
                      Image.asset(Utils.getImagePath('delete'),height: 18,width: 16),

                    ],
                  ),
                ],
              ),
                        ).paddingOnly(top: 12),
            )
            : Column(
              children: [
                Image.asset(Utils.getImagePath('no_task'),height: 18,width: 16),
                MyText(
                  title: 'Your task is empty, you have no list Todo',
                  clr: Colors.black,
                  size: 7.5.sp,
                  weight: FontWeight.w400,
                )
              ],
            );
        },
      ),
    ).paddingSymmetric(horizontal: 27,vertical: 20);
  }







}

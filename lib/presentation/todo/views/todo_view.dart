import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:todoapp/app/shared_widgets/todo_appBar.dart';
import 'package:todoapp/presentation/todo/views/completed_tab.dart';
import 'package:todoapp/presentation/todo/views/remaining_tab.dart';
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
          appBar: const TodoAppBar(title: 'Todo',isBack: false),

          body: Column(
            children: [
              SizedBox(height: 4.h),
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
        );
      }
    );
  }
}

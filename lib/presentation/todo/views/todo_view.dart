import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/app/shared_widgets/view_todo_screen.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/presentation/todo/widgets/build_section.dart';
import 'package:todoapp/presentation/todo/widgets/todo_card.dart';
import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
     init: TodoController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.offNamed(Routes.ADD_TODO);
            },
            label: const Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 10),
                Text("Add todo"),
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "My Todos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              buildSection(
                title: "Completed",
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.done.length,
                  itemBuilder: (context, index) {
                    Todo todo = controller.done[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ViewTodoScreen(todo: todo));
                      },
                      onLongPress: () {
                        controller.toggleTodo(todo);
                      },
                      child: TodoCard(
                        isDone: todo.isDone,
                        title: todo.title,
                        date: todo.cdt,
                      ),
                    );
                  },
                ),
              ),
              buildSection(
                child: ListView.builder(
                  itemCount: controller.remaining.length,
                  itemBuilder: (context, index) {
                    Todo todo = controller.remaining[index];
                    return GestureDetector(
                      onLongPress: () {
                        log("Shahzaib");
                        controller.toggleTodo(todo);
                      },
                      child: TodoCard(
                        isDone: todo.isDone,
                        title: todo.title,
                        date: todo.cdt,
                      ),
                    );
                  },
                ),
                title: "Remaining",
              ),
            ],
          ),
        );
      }
    );
  }







}

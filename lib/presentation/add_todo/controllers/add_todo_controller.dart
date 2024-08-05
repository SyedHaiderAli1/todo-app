import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/presentation/todo/controllers/todo_controller.dart';

class AddTodoController extends GetxController {
  //TODO: Implement AddTodoController
  var todos = [].obs;
  final count = 0.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode titleFocus = FocusNode();
  Todo? todo;
  String? id;
  FocusNode descriptioinFocus = FocusNode();
  @override
  void onInit() {
    super.onInit();
    todo =Get.arguments;
    if(todo!=null){
      titleController.text=todo!.title;
      descriptionController.text=todo!.description;
    }
  }



  Future<void> addTodo(Todo todo) async {
    var box = await Hive.openBox('db');
    List<Todo> currentTodos = List<Todo>.from(box.get('todos', defaultValue: []));
    currentTodos.add(todo);
    box.put('todos', currentTodos);
    todos.value = currentTodos;
    print("To Do Object added: $todos");
    Get.offNamed(Routes.TODO);


  }

  Future<void> updateTodo(Todo updatedTodo) async {
    var box = await Hive.openBox('db');
    List<Todo> currentTodos = List<Todo>.from(box.get('todos', defaultValue: []));
    int index = currentTodos.indexWhere((todo) => todo.id == updatedTodo.id);
    if (index != -1) {
      currentTodos[index] = updatedTodo;
      await box.put('todos', currentTodos);
      todos.value = currentTodos;
      await Get.find<TodoController>().getTodos();
      Get.back();
    }
    update();
  }




}

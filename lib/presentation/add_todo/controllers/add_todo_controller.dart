import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/models/todo.dart';

class AddTodoController extends GetxController {
  //TODO: Implement AddTodoController
  var todos = [].obs;
  final count = 0.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode titleFocus = FocusNode();
  FocusNode descriptioinFocus = FocusNode();
  @override
  void onInit() {
    super.onInit();
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

}

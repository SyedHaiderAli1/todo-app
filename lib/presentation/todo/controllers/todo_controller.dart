import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/models/todo.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController
  var todos = [].obs;
  var done = [].obs;
  var remaining = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    getTodos();

    super.onInit();
  }


  toggleTodo(Todo todo) async {
    var index = todos.indexOf(todo);
    var editTodo = todos[index];
    log("i am here");
    editTodo.isDone = !editTodo.isDone;
    if (editTodo.isDone) {
      done.add(editTodo);
      remaining.remove(editTodo);
    } else {
      done.remove(editTodo);
      remaining.add(editTodo);
    }
    todos[index] = editTodo;
    var box = await Hive.openBox('db');
    box.put('todos', todos.toList());
    update();
  }


  Future getTodos() async {
    Box box;
    print("Getting todos");
    try {
      box = Hive.box('db');
    } catch (error) {
      box = await Hive.openBox('db');
      print(error);
    }
    var tds = box.get('todos');
    print("TODOS $tds");
    if (tds != null) todos.value = tds;
    for (Todo todo in todos) {
      if (todo.isDone) {
        done.add(todo);
      } else {
        remaining.add(todo);
      }
    }
    update();
  }



}

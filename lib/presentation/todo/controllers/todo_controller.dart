import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/models/todo.dart';

class TodoController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement TodoController
  RxList<Todo> todos = <Todo>[].obs;
  RxList<Todo> done = <Todo>[].obs;
  RxList<Todo> remaining = <Todo>[].obs;
  final count = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    getTodos();
    super.onInit();
  }


  toggleTodo(Todo todo) async {
    var index = todos.indexOf(todo);
    var editTodo = todos[index];
    editTodo.isDone = !editTodo.isDone;
    editTodo.cdt = DateTime.now();
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


  Future<void> getTodos() async {
    todos.clear();
    done.clear();
    remaining.clear();

    Box box;
    try {
      box = Hive.box('db');
    } catch (error) {
      box = await Hive.openBox('db');
      print(error);
    }
    var tds = box.get('todos');
    if (tds != null) todos.value = List<Todo>.from(tds);
    for (Todo todo in todos) {
      if (todo.isDone) {
        done.add(todo);
      } else {
        remaining.add(todo);
      }
    }
    update();
  }


  Future<void> deleteTodo(Todo todo) async {
    todos.remove(todo);
    var box = await Hive.openBox('db');
    await box.put('todos', todos.toList());
    if (todo.isDone) {
      done.remove(todo);
    } else {
      remaining.remove(todo);
    }
    update(); // This will notify the listeners to rebuild the UI
  }



}

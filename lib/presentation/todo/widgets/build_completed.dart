// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// Widget buildCompleted() {
//   return Obx(
//         () => Container(
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
//   );
// }
//
// Widget buildRemaining() {
//   return Obx(
//         () => Container(
//       child: ListView.builder(
//         itemCount: controller.remaining.length,
//         itemBuilder: (context, index) {
//           Todo todo = controller.remaining[index];
//           return GestureDetector(
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
//   );
// }
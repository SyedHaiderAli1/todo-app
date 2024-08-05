import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;


class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.title,
    required this.date,
    required this.isDone,
  }) : super(key: key);
  final String title;
  final DateTime date;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2,
            spreadRadius: 10,
          )
        ],
        color: isDone ? Colors.green[50] : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.task_alt,
                  color: isDone ? Colors.green : Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Text(timeago.format(date)),
        ],
      ),
    );
  }
}
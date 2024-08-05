import 'package:flutter/material.dart';

Widget buildSection({String? title, Widget? child}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          Expanded(
            child: child!,
          ),
        ],
      ),
    ),
  );
}
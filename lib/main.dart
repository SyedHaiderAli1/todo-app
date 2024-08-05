import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/routes/app_pages.dart';
import 'package:todoapp/models/todo.dart';
import 'package:sizer/sizer.dart';


void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter()); // Register your custom adapter
  await Hive.openBox('db');
  runApp(
    Sizer(
        builder: (context, orientation, deviceType){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      }
    ),
  );
}

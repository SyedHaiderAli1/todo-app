import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';
import 'package:todoapp/app/utils/utils.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body:  Container(
              decoration:  const BoxDecoration(color: AppColors.primary),
              child: Center(
                  child: Image.asset(
                      scale: 4,
                      Utils.getImagePath("logo"))
              ),
            ),
          );
        }
    );
  }
}




import 'package:todoapp/app/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle regular = TextStyle();
  static TextStyle semiBold = TextStyle(fontWeight: FontWeight.w600);
  static TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle heading = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  );

  static const TextStyle subheading = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
  );

  static const TextStyle bodyText = TextStyle(
  fontSize: 16,
  fontFamily: 'Poppins-400',
  color: AppColors.white,
  );


}
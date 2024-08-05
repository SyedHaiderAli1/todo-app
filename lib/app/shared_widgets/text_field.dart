import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/config/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.height,
    this.borderRadius,
    required this.focus,
    this.maxLines,
    this.padding,
  });

  final TextEditingController controller;
  final String hintText;
  final double? height;
  final BorderRadius? borderRadius;
  final FocusNode focus;
  final int? maxLines;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      child: TextFormField(
        autofocus: true,
        focusNode: focus,
        maxLines: maxLines,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
        controller: controller,
        onTapOutside: (event) {
          focus.unfocus();
        },
      ),
    );
  }
}

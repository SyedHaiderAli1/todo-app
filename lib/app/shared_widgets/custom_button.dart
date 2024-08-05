
import 'package:flutter/material.dart';
import 'package:todoapp/app/shared_widgets/my_text.dart';
import 'package:sizer/sizer.dart';
import '../config/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onPress;
   const CustomButton({super.key,required this.text, required this.onPress});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onPress,
      child: Container(
        width: double.infinity,
        height: 43,
        decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Center(child: MyText(
          title:  widget.text,
          size: 12.sp,
          weight: FontWeight.w400,
          clr: AppColors.white))),

    );
  }
}
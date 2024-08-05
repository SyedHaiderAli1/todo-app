
import 'package:flutter/material.dart';

import '../config/app_colors.dart';
class InputTextField extends StatefulWidget {
  final String hint;
   InputTextField( {required this.hint,});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
decoration: InputDecoration(
  hintText: widget.hint ,
  hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.secondary),
  border: OutlineInputBorder(
    borderSide: BorderSide(color:AppColors.secondary ),
  borderRadius: BorderRadius.circular(5))),
    );
  }
}

//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// import '../config/app_colors.dart';
//
// class CustomDottedBorder extends StatefulWidget {
//   final Widget child;
//   final VoidCallback? onTap;
//    CustomDottedBorder({super.key, required this.child, this.onTap});
//
//   @override
//   State<CustomDottedBorder> createState() => _CustomDottedBorderState();
// }
//
// class _CustomDottedBorderState extends State<CustomDottedBorder> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:widget.onTap ,
//       child: DottedBorder(
//                     borderType: BorderType.RRect,
//                     dashPattern: [8],
//                     color: AppColors.kOrange,
//                     radius: Radius.circular(24),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: Get.height/3.5,
//                       width: Get.width/1.6,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
//                       child: widget.child,
//                     ),
//                   ),
//     );
//   }
// }
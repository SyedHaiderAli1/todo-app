import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app/config/app_colors.dart';


class MyText extends StatelessWidget {
  final String? title;
  final String? family;
  final FontWeight? weight;
  final double? size;
  final Color? clr;
  final bool? lineThrough;
  final int? line;
  final bool isUrbanist;
  final TextAlign? textAlign;
  final Paint? bgColor;
  final double? letterSpacing;
  final double? wordsSpacing;
  final TextOverflow? overFLow;
  final TextDirection? textDirection;
  final List<Shadow>? shadows;  // Add shadows property

  const MyText({
    super.key,
    this.title,
    this.size,
    this.isUrbanist = true,
    this.clr,
    this.textDirection,
    this.overFLow,
    this.weight,
    this.family,
    this.bgColor,
    this.lineThrough = false,
    this.line,
    this.letterSpacing,
    this.wordsSpacing,
    this.textAlign,
    this.shadows,  // Initialize shadows
  });

  @override
  Widget build(BuildContext context) {

    return Text(
      title!,
      textDirection: textDirection ?? TextDirection.ltr,
      maxLines: line,
      overflow: overFLow,


      style: TextStyle(
        fontWeight: weight,
        fontSize: size,
        wordSpacing: wordsSpacing,
        letterSpacing: letterSpacing,
        color: clr,
        shadows: shadows,
        decorationColor: AppColors.primary,
        decoration: lineThrough == true ? TextDecoration.lineThrough : TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }
}

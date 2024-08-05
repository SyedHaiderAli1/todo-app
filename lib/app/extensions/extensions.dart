
import 'package:flutter/cupertino.dart';

extension SizeBox on double
{
  SizedBox get height => SizedBox(height: this,);
  SizedBox get width => SizedBox(width: this,);
}
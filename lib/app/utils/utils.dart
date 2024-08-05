import 'package:intl/intl.dart';


class Utils {
  static String getImagePath(String name, {String format= 'png'}) {
    return 'assets/images/$name.$format';
  }
  static String getIconPath(String name, {String format= 'png'}) {
    return 'assets/pngs/$name.$format';
  }
  static String getSvgPath(String name, {String format= 'svg'}) {
    return 'assets/svgIcons/$name.$format';
  }


  static formatDate(DateTime now){
   return DateFormat('yyyy-MM-dd hh:mm a').format(now);
  }

}
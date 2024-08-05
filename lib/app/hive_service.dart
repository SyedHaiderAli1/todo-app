import 'package:hive_flutter/adapters.dart';

class HiveService{

 static Future<void> openBox() async {
    await Hive.openBox('bool');
    await Hive.openBox('db');
  }

 static Future<void> saveBoolValue(bool value) async {
    var box = Hive.box('bool');
    await box.put('myBoolKey', value);
  }


  static Future<bool> getBoolValue() async {
    var box = Hive.box('bool');
    return box.get('myBoolKey', defaultValue: false); // Default value if not set
  }



}
import 'package:hive_flutter/hive_flutter.dart';import 'package:intex_mobile_app/core/models/Category.dart';class DBService {  static String contacts = 'contacts';  static Future<void> init() async {    await Hive.initFlutter();    await Hive.openBox(contacts);  }  static void setData<T>(String key, dynamic value) {    var box = Hive.box(key);    box.put(key, value);  }  static void editData<T>(String key, T value, [int index = 0]) {    var box = Hive.box(key);    box.put(key, value);  }  static getData<T>(String key) {    var box = Hive.box(key);print(    box.length);return box.get(key, defaultValue: {});  }  //  // static void deleteData(String key) {  //   _box!.delete(key);  // }  //  // static void clear() {  //   _box!.clear();  // }  //  // static void close() {  //   _box!.close();  // }}
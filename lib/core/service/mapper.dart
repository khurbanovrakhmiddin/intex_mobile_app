import 'package:intex_mobile_app/core/models/Catalog.dart';import 'package:intex_mobile_app/core/models/Category.dart';/// Dio Parsing */List<Catalog> parseCatalogList(List json) {  List<Catalog> data =      json.map((item) => Catalog.fromJson(item)).toList();  return data;}List<Category> parseCategoryList(List json) {  List<Category> data =      json.map((item) => Category.fromJson(item)).toList();  return data;}String priceParser(var a) {  String result = a.toString();  String res = '';  print('a.toString().length');  print(result.length);  switch (result.length) {    case 4:      {        for (int i = 0; i < result.length; i++) {          if (i == 1) {            res += ',';          }          res += result[i];        }        break;      }    case 5:      {        for (int i = 0; i < result.length; i++) {          if (i == 2) {            res += ',';          }          res += result[i];        }        break;      }    case 6:      {        for (int i = 0; i < result.length; i++) {          if (i == 3) {            res += ',';          }          res += result[i];        }        break;      }    case 7:      {        for (int i = 0; i < result.length; i++) {          if (i == 1) {            res += ',';          }          if (i == 4) {            res += ',';          }          res += result[i];        }        break;      }    case 8:      {        for (int i = 0; i < result.length; i++) {          if (i == 2) {            res += ',';          }          if (i == 5) {            res += ',';          }          if (i == 8) {            res += ',';          }          res += result[i];        }        break;      }  }  return res;}String numberParser(var a) {  final String numb = "+$a";  String result = '';  for (int i = 0; i < numb.length; i++) {    if (i == 4) {      result += "(";    }    if (i == 6) {      result += ") ";    }    if (i == 9) {      result += " ";    }    if (i == 12) {      result += " ";    }    result += numb[i];  }  return result;}
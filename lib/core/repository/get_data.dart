import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/models/Category.dart';import 'package:intex_mobile_app/core/models/Contacts.dart';import 'package:intex_mobile_app/core/service/db_service.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/service/network_service.dart';Future<List<Catalog>> getAllData() async {  var data = await NetworkService.GET(      '/api/products/getAll', NetworkService.paramsEmpty());  if (data != null) {    return parseCatalogList(data['result']);  } else {    return [];  }}Future<Contacts> getSites() async {  try{    var data = await NetworkService.GET(        '/api/site', NetworkService.paramsEmpty());    if (data != null) {      DBService.setData(DBService.site,Contacts.fromJson(data['sites'][0]).toJson());      return Contacts.fromJson(data['sites'][0]);    } else {      return Contacts.fromJson(DBService.getData(DBService.site));    }  }catch(e){    return Contacts.fromJson(DBService.getData(DBService.site));    print(e.toString());  }}Future<List<Category>> getCategories() async {  var category = await NetworkService.GET(      '/api/category', NetworkService.paramsEmpty());  if (category != null) {    List<Category> result = [];    for (var item in category) {      result.add(Category.fromJson(item));    }    return result;  }  return [];}
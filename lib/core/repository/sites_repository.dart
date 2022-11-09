import 'package:intex_mobile_app/core/models/Category.dart';import 'package:intex_mobile_app/core/models/Contacts.dart';import 'package:intex_mobile_app/core/models/Scoial.dart';import 'package:intex_mobile_app/core/service/db_service.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/service/network_service.dart';class GetContacts{static Future<void> getContacts()async{ try {      List? result = await NetworkService.GET(          NetworkService.API_SITES, NetworkService.paramsEmpty());      if (result != null) {     print(result);     print(result);     print(result);     print(result);     print(result is List);     ;     print('1');     DBService.setData(DBService.site,Map<String,dynamic>.from(result.first));     print('2');      } }catch(e){    // contacts =   Contacts.fromJson(DBService.getData(DBService.site)); }  }static Contacts contacts ()=>Contacts.fromJson(DBService.getData(DBService.site));}class GetLinks{  static Future<void> getSocial()async{    try {      List? links = await NetworkService.GET(          NetworkService.API_LINKS, NetworkService.paramsEmpty());      if(links != null){        DBService.setData(DBService.links,List.from(links));      }    }catch(e){      print(e.toString());    }  }  static  List<Social> links ()=>parseSocialList(DBService.getData(DBService.links));}class GetCategories{  static Future<void> getCategories()async{    try {      List? categories = await NetworkService.GET(          NetworkService.API_CATEGORIES, NetworkService.paramsEmpty());      if(categories != null){        DBService.setData(DBService.category,List.from(categories));      }    }catch(e){      print(e.toString());    }  }  static  List<Category> categories ()=>parseCategoryList(DBService      .getData(DBService.category));}
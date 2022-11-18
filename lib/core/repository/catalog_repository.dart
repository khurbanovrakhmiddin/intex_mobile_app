import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/models/Category.dart';import 'package:intex_mobile_app/core/service/db_service.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/service/network_service.dart';class Repository {  List<Social> _social = [];  Contacts? _contacts;  List<Category> _category = [];  List<Status> _status = [];  AppData? _appData;  Future<Contacts?> getContacts() async {    try {      List? result = await NetworkService.GET(          NetworkService.API_SITES, NetworkService.paramsEmpty());      if (result != null) {        DBService.setData(DBService.contacts, DBService.contacts);        return _contacts = Contacts.fromJson(result.first);        print('2');      }    } catch (e) {      throw Exception(e); // contacts =   Contacts.fromJson(DBService      // .getData      // (DBService      // .site));    }    return Contacts.fromJson(DBService.getData(      DBService.contacts,    ));  }  Future<List<Social>> getSocial() async {    try {      List? links = await NetworkService.GET(          NetworkService.API_LINKS, NetworkService.paramsEmpty());      if (links != null) {        return _social = parseSocialList(List.from(links));      }      return [];    } catch (e) {      throw Exception(e);    }  }  Future<List<Category>> getCategories() async {    try {      List? categories = await NetworkService.GET(          NetworkService.API_CATEGORIES,          NetworkService.paramsEmpty());      if (categories != null) {        return _category = parseCategoryList(List.from(categories));      }      return [];    } catch (e) {      throw Exception(e);    }  }  Future<List<Status>> getProductsStatus() async {    try {      List? categories = await NetworkService.GET(          NetworkService.API_PRODUCT_Status,          NetworkService.paramsEmpty());      if (categories != null) {        return _status = parseStatuslList(List.from(categories));      }      return [];    } catch (e) {      throw Exception(e);    }  }  Future requestCall(String name, String number) async {    var response = await NetworkService.POST(        NetworkService.APi_POST_REQUEST_CALL,        {"name": name, "phone": number});    if (response.statusCode == 200 || response.statusCode == 201) {      return true;    }    return response.statusCode;  }  Contacts contacts() => _contacts!;  AppData get appData => _appData = AppData(      social: _social,      status: _status,      contacts: _contacts ?? Contacts(),      category: _category);  String? status(int id,String local) {    for (var item in _appData!.status) {      if (item.id == id) {       return local  == Lang.uz.name ? item.status_uz:local == Lang           .ru.name?item.status_ru:item.status_en;      }    }    return '';  }  String categoryById(int id,String local){    for (var item in _appData!.category) {      if (item.id == id) {        return local  == Lang.uz.name ? item.category_uz:local == Lang            .ru.name?item.category_ru:item.category_en;      }    }    return '';  }  Future requestConsult(String name, String number) async {    Map<String,dynamic> request = {      "name": name,      "phone": "+998$number"    };    print(request);    print(request);    print(request);    print(request);    var response = await NetworkService.POST(        NetworkService.APi_POST_REQUEST_CALL,        request      );    if (response.statusCode == 200 || response.statusCode == 201) {      return true;    }    return response.statusCode;  }// Future< List<Catalog>> loadCatalog()async {////   var data = await NetworkService.GET(//       '/api/products/getAll', NetworkService.paramsEmpty());//   if (data != null) {//     return parseCatalogList(data['result']);//   }else{//    return data;//   }//// }////   Future< List<Contacts>> loadSites()async=>   _contacts = await//   getSites()?? DBService.getData(DBService.site);////   List<Catalog> loadOrders()=>   _orders;//////   Future<void> addOrder(Catalog catalog)async=>   _orders.add(catalog);//////   Future<void> removeOrder(Catalog catalog)async=>   _orders.remove(catalog);////   Future< List<Category>> category()async=> _category = _category =//   await//   getCategories();//// get cat async =>  await// getCategories();// Future<List<Catalog>> getAllCatalog() async {//   var data = await NetworkService.GET(//       '/api/products/getAll', NetworkService.paramsEmpty());//   if (data != null) {//     return parseCatalogList(data['result']);//   } else {//     return [];//   }// }//// Future<Contacts> getSites() async {//   try{////     var data = await NetworkService.GET(//         '/api/site', NetworkService.paramsEmpty());//     if (data != null) {//       DBService.setData(DBService.site,Contacts.fromJson(data['sites'][0]).toJson());//       return Contacts.fromJson(data['sites'][0]);//     } else {//       return Contacts.fromJson(DBService.getData(DBService.site));////     }//   }catch(e){//     return Contacts.fromJson(DBService.getData(DBService.site));////     print(e.toString());//   }////// }//// Future<List<Category>> getCategories() async {//   var category = await NetworkService.GET(//       '/api/category', NetworkService.paramsEmpty());////   if (category != null) {//     List<Category> result = [];//     for (var item in category) {//       result.add(Category.fromJson(item));//     }//     return result;//   }//   return [];// }}
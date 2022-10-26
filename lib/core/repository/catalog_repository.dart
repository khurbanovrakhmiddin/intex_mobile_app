import 'package:intex_mobile_app/core/models/Catalog.dart';import 'package:intex_mobile_app/core/models/Category.dart';import 'package:intex_mobile_app/core/models/Contacts.dart';import 'package:intex_mobile_app/core/repository/get_data.dart';import 'package:intex_mobile_app/core/service/db_service.dart';class Repository{    List<Catalog> _list = [];    List<Category> _category= [];   late Contacts _contacts;   List<Catalog> _orders = [];  Future< List<Catalog>> loadCatalog()async => _list = await getAllData();  Future< List<Catalog>> loadSortedCatalog(int id)async {    _list = await getAllData();   return _list.where((element) => element.categoryId == id).toList();  }  Future< List<Contacts>> loadSites()async=>   _contacts = await getSites()?? DBService.getData(DBService.site);  List<Catalog> loadOrders()=>   _orders;  Future<void> addOrder(Catalog catalog)async=>   _orders.add(catalog);  Future<void> removeOrder(Catalog catalog)async=>   _orders.remove(catalog);  Future< List<Category>> category()async=> _category = _category =  await  getCategories();get cat async =>  awaitgetCategories();}
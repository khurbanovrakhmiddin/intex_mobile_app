import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/service/network_service.dart';class RepositoryCart {  Future<List<Catalog>> getCatalogs(Map<String,dynamic> params)  async {    try {      var res = await NetworkService.GET(NetworkService          .APi_GET_BYCategory, params);print(res['result']);print(res['result']);print(res['result']);print(res['result']);print(res['result']);      List<Catalog> users =   parseCatalogList(res['result']);      return users;    } catch (e) {      print(e.toString());      throw Exception(e);    }  }}
import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/service/network_service.dart';import 'package:intex_mobile_app/core/service/query.dart';class ProductByStatusRepository{  Future<List<Catalog>> getByStatus(int id,QueryParams params)async{    // var res = await NetworkService.GET(NetworkService    //     .API_ALL_DATA,    //     NetworkService.paramsEmpty());    var res = await NetworkService.GET(NetworkService        .APi_GET_BY_Status +        params.toString(),        NetworkService.paramsEmpty());    if(res != null){      return parseCatalogList(List.from(res['result']));    }    return [];  }}
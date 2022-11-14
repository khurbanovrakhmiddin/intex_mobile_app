// ignore_for_file: non_constant_identifier_namesimport 'package:equatable/equatable.dart';class AppData extends Equatable{  late List<Social> social;  late List<Category> category;  late List<Status> status;  late Contacts contacts;  AppData({required this.social,required this.category,required  this.contacts,required this.status});  @override  List<Object?> get props =>  [social,category,contacts];}class Status extends Equatable{ late int id; late String status_uz; late String status_ru; late String status_en; Status.fromJson(Map<String,dynamic> json): id = json['id'],status_uz = json['status_uz'],status_ru = json['status_ru'],status_en = json['status_en'];  @override  List<Object?> get props => [id,status_en,status_ru,status_uz];}class Category extends Equatable {   int id = 1;   String category_ru = "Shishiriladigan basseyn";   String category_uz = "Надувной бассейн";   String category_en = "Надувной бассейн";   int category_id = 1;   Category.fromJson(Map<String, dynamic> json)      : id = json['id'],         category_ru = json['category_ru'],         category_uz = json['category_uz'],         category_en = json['category_en'],         category_id = json['category_id']??0;  @override  List<Object?> get props => [id,category_id,category_en,    category_ru,category_uz];}// ignore_for_file: non_constant_identifier_namesclass Contacts  extends Equatable {  Contacts();  Contacts.fromJson(dynamic json) {    id = json['id'];    phone = json['phone']??'';    address_ru = json['address_ru'];    address_uz = json['address_uz'];    address_en = json['address_en'];    work_uz = json['work_uz'];    work_ru = json['work_ru'];    work_en = json['work_en'];    email = json['email'];  }  late  int id;  String phone = '';  String email = '';  late  String address_ru;  late  String address_uz;  late  String address_en;  late  String work_ru;  late  String work_uz;  late  String work_en;  Map<String, dynamic> toJson() {    final map = <String, dynamic>{};    map['id'] = id;    map['phone'] = phone;    map['email'] = email;    map['address_ru'] = address_ru;    map['address_uz'] = address_uz;    map['address_en'] = address_en;    map['work_uz'] = work_uz;    map['work_ru'] = work_ru;    map['work_en'] = work_en;    return map;  }  @override  List<Object?> get props => [id,phone,email,address_uz,address_ru,    address_en,work_ru,work_uz,work_en];}class Social extends Equatable {  late int id;  late String name;  late String link;  Social.fromJson(Map<String, dynamic> json)      : id = json['id'],        name = json['name'],        link = json['link'];  Map<String,dynamic> toJson()=>{    'id': id,    'name': name,    'link': link,  };  @override  List<Object?> get props => [id, name, link];}
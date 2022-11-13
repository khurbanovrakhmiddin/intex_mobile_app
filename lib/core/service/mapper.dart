import 'dart:convert';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/models/Category.dart';/// Dio Parsing */List<Catalog> parseCatalogList(List json) {  List<Catalog> data =      json.map((item) => Catalog.fromJson(item)).toList();  return data;}List<Social> parseSocialList(List list){  print(list);  print(list);  print(list);  print(list);  print(list);  print(list);  print(list);  print(list);  List<Social> social = [];  for(var item in list){    print(item is Map<String,dynamic> );    print(item is Map<String,dynamic> );    print(item is Map  );    social.add(Social.fromJson(Map<String,dynamic>.from(item)));  }  return social;}List<Category> parseCategoryList(List json) {  print(json);  print(json);  print(json);  print(json);  print(json);  List<Category> data =      json.map((item) => Category.fromJson(item)).toList();  return data;}String priceParser(var a,String lang) {  String result = a.toString();  String res = '';  switch (result.length) {    case 4:      {        for (int i = 0; i < result.length; i++) {          if (i == 1) {            res += ' ';          }          res += result[i];        }        break;      }    case 5:      {        for (int i = 0; i < result.length; i++) {          if (i == 2) {            res += ' ';          }          res += result[i];        }        break;      }    case 6:      {        for (int i = 0; i < result.length; i++) {          if (i == 3) {            res += ' ';          }          res += result[i];        }        break;      }    case 7:      {        for (int i = 0; i < result.length; i++) {          if (i == 1) {            res += ' ';          }          if (i == 4) {            res += ' ';          }          res += result[i];        }        break;      }    case 8:      {        for (int i = 0; i < result.length; i++) {          if (i == 2) {            res += ' ';          }          if (i == 5) {            res += ' ';          }          if (i == 8) {            res += ' ';          }          res += result[i];        }        break;      }  }  return '$res${valyutaParse(lang)}';}String numberParser(var a) {  final String numb = "+$a";  String result = '';  for (int i = 0; i < numb.length; i++) {    if (i == 4) {      result += "(";    }    if (i == 6) {      result += ") ";    }    if (i == 9) {      result += " ";    }    if (i == 11) {      result += " ";    }    result += numb[i];  }  return result;}String valyutaParse(String lang){  switch(lang){    case 'uz':return " so'm";    case 'ru':return " сум";    case 'en':return " soum";    default: return "so'm";  }}List<Widget> checkLocal(String local,BuildContext context){  switch(local){    case 'uz': return [      Padding(        padding: const EdgeInsets.only(left: 40),        child: ElevatedButton.icon(          onPressed: () => context.setLocale(const Locale('ru', 'RU')),          style: ElevatedButton.styleFrom(              elevation: 0,              backgroundColor:              Theme.of(context).dividerColor),          label: const Text(            "РУ",            style: TextStyle(                fontSize: 14,                fontWeight: FontWeight.w500,                color: Colors.black),          ),          icon:  Image.asset( "assets/icons/flagRu"              ".png",            width: 28,height: 20,          ),        ),      ),      Padding(        padding: const EdgeInsets.only(left: 40),        child: ElevatedButton.icon(          onPressed: () => context              .setLocale(const Locale('en', 'US')),          style: ElevatedButton.styleFrom(              elevation: 0,              backgroundColor:              Theme.of(context).dividerColor),          label: const Text(            "EN",            style: TextStyle(                fontSize: 14,                fontWeight: FontWeight.w500,                color: Colors.black),          ),          icon:  Image.asset( "assets/icons/flagUs"              ".png",            width: 28,height: 20,          ),        ),      ),    ];    case 'ru': return [      Padding(        padding: const EdgeInsets.only(left: 40),        child: ElevatedButton.icon(          style: ElevatedButton.styleFrom(              elevation: 0,              backgroundColor:              Theme.of(context).dividerColor),          onPressed: () => context              .setLocale(const Locale('uz', 'UZ')),          label: const Text(            "UZ",            style: TextStyle(                fontSize: 14,                fontWeight: FontWeight.w500,                color: Colors.black),          ),          icon:  Image.asset( "assets/icons/flagUz"              ".png",            width: 28,height: 20,          ),        ),      ),      Padding(        padding: const EdgeInsets.only(left: 40),        child: ElevatedButton.icon(          onPressed: () => context              .setLocale(const Locale('en', 'US')),          style: ElevatedButton.styleFrom(              elevation: 0,              backgroundColor:              Theme.of(context).dividerColor),          label: const Text(            "EN",            style: TextStyle(                fontSize: 14,                fontWeight: FontWeight.w500,                color: Colors.black),          ),          icon:  Image.asset( "assets/icons/flagUs"              ".png",            width: 28,height: 20,          ),        ),      ),    ];    case 'en': return [      Padding(        padding: const EdgeInsets.only(left: 40),        child: ElevatedButton.icon(          style: ElevatedButton.styleFrom(              elevation: 0,              backgroundColor:              Theme.of(context).dividerColor),          onPressed: () => context              .setLocale(const Locale('uz', 'UZ')),          label: const Text(            "UZ",            style: TextStyle(                fontSize: 14,                fontWeight: FontWeight.w500,                color: Colors.black),          ),          icon:  Image.asset( "assets/icons/flagUz"              ".png",            width: 28,height: 20,          ),        ),      ),      Padding(        padding: const EdgeInsets.only(left: 40),        child: ElevatedButton.icon(          onPressed: () => context              .setLocale(const Locale('ru', 'RU')),          style: ElevatedButton.styleFrom(              elevation: 0,              backgroundColor:              Theme.of(context).dividerColor),          label: const Text(            "РУ",            style: TextStyle(                fontSize: 14,                fontWeight: FontWeight.w500,                color: Colors.black),          ),          icon:  Image.asset( "assets/icons/flagRu"              ".png",            width: 28,height: 20,          ),        ),      ),    ];  }  return [];}socialGet(List<Social> list,String s){ for(var item in list){  if( item.name == s){    return item.link;  } }}
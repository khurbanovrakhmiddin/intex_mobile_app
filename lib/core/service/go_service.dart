import 'dart:convert';import 'package:flutter/material.dart';import 'package:go_router/go_router.dart';import 'package:intex_mobile_app/core/models/Category.dart';import 'package:intex_mobile_app/features/app.dart';import 'package:intex_mobile_app/features/screens/conect_page/view/connect_check/checker/check_state.dart';import 'package:intex_mobile_app/features/screens/detail_page/page/detail_page.dart';import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';import '../../features/screens/conect_page/view/connect_check/checker/check_servicde.dart';class GoService{  static String local = '';static   final router = GoRouter(  redirect: (context, state) async{    ConnectionStatus status =await CheckInternetConnection.connect();    var connect = status.name ==        ConnectionStatus        .online.name;    if (!connect) {      local = state.location.isEmpty?'/':state.location;      return 'NoConnect';    }    if (connect) {      return local.isEmpty?'/':local;    }    return null;  },   refreshListenable: ConnectionStatusValueNotifier(),  initialLocation: '/',  routes: [    GoRoute(      path: '/',      name: 'Main',      pageBuilder: (context, state) =>          MaterialPage(key: state.pageKey, child: const MainPage()),    ),    GoRoute(      path: '/connect',      name: 'NoConnect',      pageBuilder: (context, state) =>          MaterialPage(key: state.pageKey, child: const OffLinePage()),    ),    GoRoute(      path: '/second/:category',      name: 'Second',      pageBuilder: (context, state) {        Category category = Category.fromJson(jsonDecode(state            .params['category']!));        return  MaterialPage(key: state.pageKey, child:        DetailPage(category: category));      },    ),  ],  errorPageBuilder: (context, state) => MaterialPage(    key: state.pageKey,    child: Scaffold(      body: Center(        child: Text(state.error.toString()),      ),    ),  ),);}
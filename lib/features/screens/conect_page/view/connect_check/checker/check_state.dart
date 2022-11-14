import 'dart:async';import 'package:flutter/material.dart';import 'package:intex_mobile_app/features/screens/conect_page/view/connect_check/checker/check_servicde.dart';class ConnectionStatusValueNotifier extends ValueNotifier<ConnectionStatus> {  static final internetChecker = CheckInternetConnection();  late StreamSubscription _connectionSubscription;  ConnectionStatusValueNotifier() : super(ConnectionStatus.online) {    _connectionSubscription = internetChecker        .internetStatus()        .listen((newStatus) => value = newStatus);  }  @override  void dispose() {    _connectionSubscription.cancel();    super.dispose();  }}
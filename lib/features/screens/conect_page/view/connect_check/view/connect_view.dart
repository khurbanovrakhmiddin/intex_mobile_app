import 'package:flutter/material.dart';import 'package:intex_mobile_app/core/service/connect_check/check_servicde.dart';import 'package:intex_mobile_app/core/service/connect_check/check_state.dart';import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';class WarningWidgetValueNotifier extends StatelessWidget {  const WarningWidgetValueNotifier({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return ValueListenableBuilder(      valueListenable: ConnectionStatusValueNotifier(),      builder: (context, ConnectionStatus status, child) {        return SliverAppBar(            pinned: true,            floating: true,            title: Visibility(          visible: status != ConnectionStatus.online,          child: Padding(            padding: const EdgeInsets.all(16),            child: SizedBox(              height: 60,              child: ColoredBox(                color: Colors.red,                child: Row(                  children:  [                    Icon(Icons.wifi_off),                    SizedBox(width: 8),                    Text('Нет соединения с интернетом'),                    IconButton(onPressed: ()=>Navigator                        .pushReplacement(context, MaterialPageRoute                      (builder: (context)=>MainPage())), icon: Icon                      (Icons.replay))                  ],                ),              ),            ),          ),        ));      },    );  }}
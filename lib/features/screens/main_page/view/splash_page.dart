import 'package:flutter/material.dart';import 'package:intex_mobile_app/core/constants/text.dart';class SplashScreen extends StatelessWidget {  const SplashScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return  Scaffold(      body: Center(        child: Column(          mainAxisAlignment: MainAxisAlignment.center,          children: const [            Text(            title,            style: TextStyle(                color: Color.fromRGBO(16, 158, 244, 1),                fontSize: 35,                fontWeight: FontWeight.bold),          ),            SizedBox(height: 20,),            CircularProgressIndicator()        ],),      ),    );  }}
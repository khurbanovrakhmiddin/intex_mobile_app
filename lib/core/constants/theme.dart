import 'package:flutter/material.dart';import 'package:intex_mobile_app/core/constants/text.dart';ThemeData light = ThemeData(dividerColor: Colors.white,    ///#background    backgroundColor: const Color.fromRGBO(248, 248, 248, 1),    hintColor:const Color.fromRGBO(235, 245, 245, 1.0),    ///#main    bottomAppBarColor: const Color.fromRGBO(43, 61, 144, 1),    ///#button    primaryColor: const Color.fromRGBO(16, 158, 244, 1),    indicatorColor: const Color.fromRGBO(255, 58, 58, 1),    ///#neww product    hoverColor: const Color.fromRGBO(11, 204, 35, 1),    ///# discount    disabledColor: const Color.fromRGBO(255, 92, 92, 1),    highlightColor: Colors.grey.shade300,    ///# popular     splashColor: const Color.fromRGBO(250, 250, 250, 1),    ///# block    cardColor: const Color.fromRGBO(242, 246, 250, 1),    canvasColor: const Color.fromRGBO(247, 249, 250, 1),///#category Background    shadowColor: const Color.fromRGBO(229, 229, 229,1),    appBarTheme: const AppBarTheme(      backgroundColor: Colors.white,    ),    textTheme: const TextTheme(      ///#app bar title      headline1: TextStyle(          fontSize: 30,          fontWeight: FontWeight.w900,          fontFamily: 'Inter',          color: Color.fromRGBO(16, 158, 244, 1)),      ///#about view subtitle title      headline2: TextStyle(          fontSize: 16,          fontWeight: FontWeight.w700,          fontFamily: 'Inter',          letterSpacing: 0.4,          color: Colors.black),      ///#about view subtitle subtitle      headline3: TextStyle(          fontSize: 14,          fontWeight: FontWeight.w400,          fontFamily: 'Inter',          letterSpacing: 0.4,          color: Colors.black),      ///#card title      // headline3: TextStyle(      //     fontSize: 12,      //     fontWeight: FontWeight.w700,      //     fontFamily: 'Trebuchet',      //     color: Colors.white),      headline4: TextStyle(          fontSize: 21,          fontWeight: FontWeight.w700,          fontFamily: 'Trebuchet',          color:Color.fromRGBO(43, 61, 144, 1),),      headline5: TextStyle(          fontSize: 12,          fontWeight: FontWeight.w700,          fontFamily: 'Trebuchet',          letterSpacing: 1,          color: Colors.white),      headline6: TextStyle(          fontSize: 16,          fontWeight: FontWeight.w500,          fontFamily: 'Trebuchet',          letterSpacing: 1,          color: Color.fromRGBO(36, 40, 58, 1)),    ));Color saleType(TypeSale type){  switch(type){    case TypeSale.discount: return const Color.fromRGBO(255, 92, 92, 1);    case TypeSale.neww: return const Color.fromRGBO(11, 204, 35, 1);    case TypeSale.popular: return  const Color.fromRGBO(255, 58, 58, 1);  }}
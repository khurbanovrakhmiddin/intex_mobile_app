import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intex_mobile_app/core/constants/theme.dart';
import 'package:intex_mobile_app/core/repository/product_by_status_repository.dart';
import 'package:intex_mobile_app/core/service/db_service.dart';
import 'package:intex_mobile_app/core/service/observ_service.dart';
import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';
import 'core/models/Category.dart';
import 'core/repository/catalog_repository.dart';
import 'core/service/go_service.dart';
import 'features/app.dart';
import 'package:intex_mobile_app/core/repository/cart_repository.dart';
import 'package:intex_mobile_app/core/utils/product_category.dart';
import 'package:intex_mobile_app/features/screens/cart_page/bloc/products_bloc.dart';
import 'package:intex_mobile_app/features/screens/cart_page/cart_bloc/cart_bloc.dart';

import 'features/screens/cart_page/first_bloc/first_product_bloc.dart';
import 'features/screens/cart_page/second_bloc/second_product_bloc.dart';
import 'features/screens/cart_page/third_bloc/third_product_bloc.dart';
import 'features/screens/conect_page/view/connect_check/checker/check_servicde.dart';
import 'features/screens/conect_page/view/connect_check/checker/check_state.dart';
import 'features/screens/detail_page/page/detail_page.dart';
import 'features/screens/main_page/bloc/main_bloc.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DBService.init();
  try {
  } catch (e) {
    print('error: $e');
  }
  Bloc.observer = SimpleBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {

    MyApp({super.key});
      final router = GoRouter(
     redirect: (context, state) async{
       ConnectionStatus status =await CheckInternetConnection.connect();
       var connect = status.name ==
           ConnectionStatus
               .online.name;

       if (!connect) {
       //  local = state.location.isEmpty?'/':state.location;
         return '/connect';
       }

       if (connect) {
         return '/';
       }

       return null;
     },

     refreshListenable: ConnectionStatusValueNotifier(),


     initialLocation: '/',
     routes: [
       GoRoute(
           path: '/',
           name: 'Main',
           pageBuilder: (context, state) {
             return CustomTransitionPage(
               key: state.pageKey,
               child: const MainPage(),
               transitionsBuilder: (context, animation, secondaryAnimation, child) {
                 return FadeTransition(
                   opacity:
                   CurveTween(curve: Curves.easeInQuad).animate(animation),
                   child: child,
                 );
               },
             );
           }),
       GoRoute(
           path: '/connect',
           name: 'NoConnect',
           pageBuilder: (context, state) {

             return CustomTransitionPage(
               key: state.pageKey,
               child: const OffLinePage(),
               transitionsBuilder: (context, animation, secondaryAnimation, child) {
                 return FadeTransition(
                   opacity:
                   CurveTween(curve: Curves.easeInQuad).animate(animation),
                   child: child,
                 );
               },
             );
           }
       ),
       GoRoute(
         path: '/detail/:category',
         name: 'Detail',
         pageBuilder: (context, state) {


           Category category = Category.fromJson(jsonDecode(state
               .params['category']!));

           return CustomTransitionPage(
             key: state.pageKey,
             child:  DetailPage(category: category),
             transitionsBuilder: (context, animation, secondaryAnimation, child) {
               return FadeTransition(
                 opacity:
                 CurveTween(curve: Curves.easeInQuad).animate(animation),
                 child: child,
               );
             },
           );

         },
       ),

     ],
     errorPageBuilder: (context, state) => MaterialPage(
       key: state.pageKey,
       child: Scaffold(
         body: Center(
           child: Text(state.error.toString()),
         ),
       ),
     ),
   );
  @override
  Widget build(BuildContext context) {
    print('MyApp');
      return  MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
          MainBloc(repository: Repository())
            ..add(const MainInitialEvent()),
        ),
        BlocProvider(
            create: (context) => FirstProductBloc(
                ProductByStatusRepository())),
        BlocProvider(
            create: (context) => SecondProductBloc(
                ProductByStatusRepository())),
        BlocProvider(
            create: (context) => ThirdProductBloc(
                ProductByStatusRepository())),

      ], child:  MaterialApp.router(
      debugShowCheckedModeBanner: false,
    localizationsDelegates: context.localizationDelegates,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
    theme: light,
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
              boldText: false,
            ),
            child:child!
        ),
      );

    },
    routerConfig: router,
    ));
    }






  }


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex_mobile_app/core/constants/theme.dart';
import 'package:intex_mobile_app/core/repository/product_by_status_repository.dart';
import 'package:intex_mobile_app/core/service/db_service.dart';
import 'package:intex_mobile_app/core/service/observ_service.dart';
import 'package:intex_mobile_app/features/screens/main_page/view/error_page.dart';
import 'core/repository/catalog_repository.dart';
import 'features/screens/cart_page/first_bloc/first_product_bloc.dart';
import 'features/screens/cart_page/second_bloc/second_product_bloc.dart';
import 'features/screens/cart_page/third_bloc/third_product_bloc.dart';
import 'features/screens/main_page/bloc/main_bloc.dart';
import 'features/screens/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DBService.init();
  try {} catch (_) {
  }
  Bloc.observer = SimpleBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ')
      ],
      errorWidget: (error) => ErrorPage(message: error!.message
          .toString()),
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainBloc(repository: Repository())
              ..add(const MainInitialEvent()),
          ),
          BlocProvider(
              create: (context) =>
                  FirstProductBloc(ProductByStatusRepository())),
          BlocProvider(
              create: (context) =>
                  SecondProductBloc(ProductByStatusRepository())),
          BlocProvider(
              create: (context) =>
                  ThirdProductBloc(ProductByStatusRepository())),
        ],
        child: MaterialApp.router(
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
                  child: child!),
            );
          },
          routerConfig: Rout.router,
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

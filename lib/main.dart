import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex_mobile_app/core/constants/theme.dart';
import 'package:intex_mobile_app/core/repository/catalog_repository.dart';
import 'package:intex_mobile_app/core/service/db_service.dart';
import 'package:intex_mobile_app/core/service/observ_service.dart';
import 'package:intex_mobile_app/features/screens/conect_page/bloc/connect_bloc.dart';
import 'package:intex_mobile_app/features/screens/main_page/bloc/main_bloc.dart';
import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';


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
      child: const MyApp(
      )));
}

class MyApp extends StatelessWidget {


  const MyApp(
      {super.key});

  @override
  Widget build(BuildContext context) {
    print('MyApp');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: light,
      builder: (context, child) {



        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
            boldText: false,
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => ConnectBloc()..add(NetworkObserve()),
            ),
            BlocProvider( create: (context) => MainBloc(
                repository: Repository())..add(const MainInitialEvent()),
            ),
          ],   child: child!,),
        );
      },
      home: const MainPage(),
    );
  }
}

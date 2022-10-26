import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex_mobile_app/core/constants/theme.dart';
import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  runApp( EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU'),
        Locale('uz', 'UZ')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('ru', 'RU'),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: light,
      home: const MainPage(),
    );
  }
}



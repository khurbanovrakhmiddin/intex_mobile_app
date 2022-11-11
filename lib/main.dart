import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex_mobile_app/core/constants/theme.dart';
import 'package:intex_mobile_app/core/repository/catalog_repository.dart';
import 'package:intex_mobile_app/core/repository/sites_repository.dart';
import 'package:intex_mobile_app/core/service/db_service.dart';
import 'package:intex_mobile_app/core/service/observ_service.dart';
import 'package:intex_mobile_app/features/screens/detail_page/page/detail_page.dart';
import 'package:intex_mobile_app/features/screens/main_page/bloc/main_bloc.dart';
import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';

import 'core/models/Category.dart';
import 'core/models/Contacts.dart';
import 'features/screens/cart_page/bloc/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DBService.init();

  try {
    await GetContacts.getContacts();
    await GetLinks.getSocial();
    await GetCategories.getCategories();
  } catch (e) {
    print('error: $e');
  }

  Contacts contacts = GetContacts.contacts();
  final List<Category> category = GetCategories.categories();

  Bloc.observer = SimpleBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      child: MyApp(
        contacts: contacts,
        category: category,
      )));
}

class MyApp extends StatelessWidget {
  final Contacts contacts;
  final List<Category> category;

  const MyApp(
      {super.key, required this.contacts, required this.category});

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
          child: BlocProvider(
            create: (context) => MainBloc(
                repository: Repository(),
                category: category,
                contacts: contacts),
            child: child!,
          ),
        );
      },
      home: MainPage(),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:intex_mobile_app/core/constants/text.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/features/screens/cart_page/bloc/cart_bloc.dart';import 'package:intex_mobile_app/features/screens/detail_page/page/detail_page.dart';import 'package:intex_mobile_app/features/screens/main_page/bloc/main_bloc.dart';import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';import 'buttons/span_button.dart';class CustomDrawer extends StatelessWidget {  const CustomDrawer({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    final category = context.read<MainBloc>().repository.category();    return Drawer(      width: MediaQuery.of(context).size.width * .8,      elevation: 0,      backgroundColor: Theme.of(context).dividerColor,      child: Padding(          padding: EdgeInsets.only(              top: MediaQuery.of(context).padding.top,              left: 24,              right: 24,              bottom: 50),          child: SingleChildScrollView(              child: Column(                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  Text(                    companyname,                    style: Theme.of(context).textTheme.headline1,                  ),                  const SizedBox(                    height: 42.7,                  ),                  //#language                  ExpansionTile(                    expandedAlignment: Alignment.centerLeft,                    title: Row(                      children: [                        Image.asset(                          context.locale.languageCode == 'uz'                              ? "assets/icons/flagUz.png"                              : context.locale.languageCode == 'ru'                              ? "assets/icons/flagRu.png"                              : "assets/icons/flagUs.png",                          width: 28,                          height: 20,                        ),                        const SizedBox(                          width: 10,                        ),                        Text(                          context.locale.languageCode == 'uz'                              ? "UZ"                              : context.locale.languageCode == 'ru'                              ? "РУ"                              : "EN",                          style: const TextStyle(                              fontSize: 14,                              fontWeight: FontWeight.w500,                              color: Colors.black),                        ),                      ],                    ),                    children:                    checkLocal(context.locale.languageCode, context),                  ),                  Divider(                    color: Colors.grey.shade400,                  ),                  //#category                  ExpansionTile(                    expandedAlignment: Alignment.bottomLeft,                    collapsedIconColor: Colors.grey,                    title: Text(categoryS.tr(),                        style: Theme.of(context).textTheme.headline6),                    children: List.generate(                      category.length,                          (index) => Align(                        alignment: Alignment.centerLeft,                        child: Padding(                          padding:                          const EdgeInsets.symmetric(vertical: 10),                          child: SpanButton(                            title: context.locale.languageCode == 'ru'                                ? category[index].category_ru                                : context.locale.languageCode == 'uz'                                ? category[index].category_uz                                : category[index].category_en,                            style: Theme.of(context)                                .textTheme                                .headline6                                ?.copyWith(                                fontSize: 14,                                fontWeight: FontWeight.w400),                            onPressed: ()async {                              print('pop');                              print('pop');                           await   Navigator.of(context).push(                                (MaterialPageRoute(builder:                              (context)=> DetailPage(category:                              category[index])))).then(                                   (value) =>    Navigator.pop(context)                           );                            },                          ),                        ),                      ),                    ),                  ),                  Divider(                    color: Colors.grey.shade400,                  ),                  const SizedBox(                    height: 20,                  ),                  SpanButton(                      title: popular,                      style: Theme.of(context).textTheme.headline6,                      onPressed: () {}),                  const SizedBox(                    height: 20,                  ),                  SpanButton(                      title: news,                      style: Theme.of(context).textTheme.headline6,                      onPressed: () {}),                  const SizedBox(                    height: 20,                  ),                  SpanButton(                      title: discount,                      style: Theme.of(context).textTheme.headline6,                      onPressed: () {}),                  const SizedBox(                    height: 20,                  ),                  SpanButton(                      title: productAbout,                      style: Theme.of(context).textTheme.headline6,                      onPressed: () {}),                  const SizedBox(                    height: 20,                  ),                  SpanButton(                      title: whyWe,                      style: Theme.of(context).textTheme.headline6,                      onPressed: () {}),                  const SizedBox(                    height: 20,                  ),                  SpanButton(                      title: cont,                      style: Theme.of(context).textTheme.headline6,                      onPressed: () {}),                  const SizedBox(                    height: 20,                  ),                ],              ))),    );  }}
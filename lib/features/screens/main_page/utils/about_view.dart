import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:intex_mobile_app/core/constants/text.dart';import 'package:intex_mobile_app/core/models/Contacts.dart';import 'package:intex_mobile_app/core/service/local_service.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/utils/button.dart';import 'package:intex_mobile_app/core/utils/link_button.dart';import 'package:intex_mobile_app/core/utils/product_category.dart';import 'package:intex_mobile_app/core/utils/span_button.dart';class AboutView extends StatelessWidget {  final Contacts contacts;  const AboutView({Key? key, required this.contacts})      : super(key: key);  @override  Widget build(BuildContext context) {    return SingleChildScrollView(      keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag ,      child: Column(        children: [          ///# 1 step  request call          const _RequestCall(),          const SizedBox(height: 69.5,),          const ProductCategory(type:popularProduct),          const SizedBox(height: 69.5,),          ///# 2 step          const AboutFor(),          const SizedBox(height: 45.5,),          const ProductCategory(type:newProduct),          const SizedBox(            height: 24,          ),          _CompanyQuality(),          const ProductCategory(type:discountProduct),          ///# 3 step          CompanyInfo(            contacts: contacts,          ),        ],      ),    );  }}class _RequestCall extends StatelessWidget {  const _RequestCall({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Container(      height: 474,      width: double.infinity,      padding: const EdgeInsets.symmetric(          horizontal: 16, vertical: 24),        margin: const EdgeInsets.symmetric(            horizontal: 16, vertical: 24),          decoration: BoxDecoration(            borderRadius: BorderRadius.circular(20),            color: Theme.of(context).canvasColor,          ),              child: Column(                children: [                  Text(                    fromIntex,                    style: Theme.of(context)                        .textTheme                        .headline2                        ?.copyWith(fontSize: 24),                    overflow: TextOverflow.ellipsis,                    maxLines: 2,                  ),                  const SizedBox(                    height: 16,                  ),                  Text(                      stepFirstAbout,                      style: Theme.of(context).textTheme.headline3,                      overflow: TextOverflow.ellipsis,                      maxLines: 10,                  ),                  const SizedBox(                    height: 24,                  ),                  Image.asset(                      'assets/images/quality.png',                      height:                          160,                      fit: BoxFit.cover,                      width: double.infinity),                  const SizedBox(                    height: 43,                  ),                  ///# request call                  CustomButton(                    title: requestCall,                    onPressed: () {},                    color: Theme.of(context).bottomAppBarColor,                  ),                ],              ),            );  }}class CompanyInfo extends StatelessWidget {  final Contacts contacts;  const CompanyInfo({Key? key, required this.contacts})      : super(key: key);  @override  Widget build(BuildContext context) {    String lang = context.locale.languageCode;    return SizedBox(      height: 980,      width: double.infinity,      child: ColoredBox(        color: Theme.of(context).canvasColor,        child: Padding(          padding: const EdgeInsets.symmetric(horizontal: 22),          child: Column(            crossAxisAlignment: CrossAxisAlignment.start,            children: [              const SizedBox(                height: 44,              ),              Text(                companyname.tr(),                style: Theme.of(context).textTheme.headline1,              ),              const SizedBox(                height: 30,              ),              Text(                aboutIntex1.tr(),                style: Theme.of(context)                    .textTheme                    .headline2                    ?.copyWith(fontWeight: FontWeight.w400),              ),              const SizedBox(                height: 39,              ),              Row(                children: [                  LinkButton(                    onPressed: () {},                    title: 'f',                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                    onPressed: () {},                    title: 'in',                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                    onPressed: () {},                    title: '',                    icon: SvgPicture.asset(instagramSVG),                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                      onPressed: () {},                      title: '',                      icon: SvgPicture.asset(twitterSVG)),                ],              ),              const SizedBox(                height: 31,              ),              ///#title Address              const _cutomTextWidget(title: link),              const SizedBox(                height: 16,              ),              SpanButton(title: productAbout, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: whyWe, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: cont, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: category, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: popular, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: news, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: discount, onPressed: () {}),              const SizedBox(                height: 8,              ),              const _cutomTextWidget(title: callCentre),              const SizedBox(                height: 16,              ),              SpanButton(title: deliveryAndPayment, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: frequentlyAsked, onPressed: () {}),              const SizedBox(                height: 8,              ),              SpanButton(title: confidential, onPressed: () {}),              const SizedBox(                height: 16,              ),              const _cutomTextWidget(title: address),              const SizedBox(                height: 16,              ),              const SizedBox(                height: 24,              ),              ///#address              Row(                children: [                  Icon(                    Icons.location_on_outlined,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  ///TODO: Lang En Setting                  SizedBox(                    width: MediaQuery.of(context).size.width * .7,                    child: Text(                      lang == Lang.ru.name                          ? contacts.address_ru                          : lang == Lang.en.name                              ? contacts.address_en                              : contacts.address_uz,                      overflow: TextOverflow.ellipsis,                      maxLines: 2,                    ),                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#number              Row(                children: [                  Icon(                    CupertinoIcons.phone,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  Text(                    numberParser(contacts.phone),                    overflow: TextOverflow.ellipsis,                    maxLines: 4,                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#gmaiadress              Row(                children: [                  Icon(                    Icons.mail_outline,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  Text(                    contacts.email,                    overflow: TextOverflow.ellipsis,                    maxLines: 4,                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#working time              Row(                children: [                  Icon(                    CupertinoIcons.clock,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  InkWell(                    onTap: () {},                    child: Text(                      lang == Lang.ru.name                          ? contacts.work_ru                          : lang == Lang.en.name                              ? contacts.work_en                              : contacts.work_ru,                      overflow: TextOverflow.ellipsis,                      maxLines: 4,                    ),                  ),                ],              ),              const SizedBox(                height: 16,              ),              Divider(                color: Theme.of(context).primaryColor,              ),              const SizedBox(                height: 16,              ),              Text(                endPage,                style: Theme.of(context).textTheme.headline3,              )            ],          ),        ),      ),    );  }}class _cutomTextWidget extends StatelessWidget {  final String title;  const _cutomTextWidget({    Key? key,    required this.title,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Text(      title,      style: Theme.of(context)          .textTheme          .headline2          ?.copyWith(fontSize: 18),    );  }}class _AboutSubTitle extends StatelessWidget {  final String title;  const _AboutSubTitle({    Key? key,    required this.title,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return ClipRRect(      borderRadius: BorderRadius.circular(20),      child: ColoredBox(          color: Theme.of(context).dividerColor,          child: Row(            children: [              SizedBox(                height: 24,                width: 24,                child: ClipRRect(                  borderRadius: BorderRadius.circular(123123),                  child: ColoredBox(                    color: Theme.of(context).primaryColor,                    child: const Icon(                      CupertinoIcons.checkmark_alt,                      color: Colors.white,                      size: 20,                    ),                  ),                ),              ),              const SizedBox(                width: 17,              ),              Text(title),              const SizedBox(                width: 10,              ),            ],          )),    );  }}class _AboutTitle extends StatelessWidget {  final String title;  final String subtitle;  final String image;  const _AboutTitle({    Key? key,    required this.title,    required this.subtitle,    required this.image,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Column(      crossAxisAlignment: CrossAxisAlignment.start,      children: [        SizedBox(            height: 220,            width: double.infinity,            child: ClipRRect(                borderRadius: BorderRadius.circular(10),                child: ColoredBox(                  color: const Color(0xfff0f5f9),                  child: Image.asset(                    image,                    fit: BoxFit.contain,                  ),                ))),        const SizedBox(          height: 17,        ),        Text(          title,          style: Theme.of(context).textTheme.headline2,        ),        const SizedBox(          height: 6,        ),        Text(subtitle, style: Theme.of(context).textTheme.headline3),        const SizedBox(          height: 24,        ),      ],    );  }}///#step 1class _CompanyQuality extends StatelessWidget {  @override  Widget build(BuildContext context) {    return Column(      children: [        Text(          aboutclient,          style: Theme.of(context)              .textTheme              .headline2              ?.copyWith(fontSize: 18),        ),        const SizedBox(          height: 51,        ),        const _AboutTitle(            title: aboutEcperience,            subtitle: aboutEcperience1,            image: 'assets/images/experience.png'),        const _AboutTitle(            title: aboutDelivery,            subtitle: aboutDelivery1,            image: 'assets/images/img_delivery.png'),        const _AboutTitle(            title: aboutQuality,            subtitle: aboutQuality1,            image: 'assets/images/quality.png'),        const SizedBox(          height: 30,        ),      ],    );  }}///#step 2class AboutFor extends StatelessWidget {  const AboutFor({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return ColoredBox(      color: Theme.of(context).canvasColor,      child: Padding(          padding: const EdgeInsets.symmetric(horizontal: 20),          child: Column(            crossAxisAlignment: CrossAxisAlignment.start,            children: [              Text(                fromIntex,                style: Theme.of(context)                    .textTheme                    .headline2                    ?.copyWith(fontSize: 18),              ),              const SizedBox(                height: 15,              ),              Text(                aboutIntex2,                style: Theme.of(context)                    .textTheme                    .headline3                    ?.copyWith(color: Colors.black),              ),              Wrap(                direction: Axis.vertical,                children: const [                  _AboutSubTitle(title: a),                  SizedBox(                    height: 7,                  ),                  _AboutSubTitle(title: b),                  SizedBox(                    height: 7,                  ),                  _AboutSubTitle(title: c),                  SizedBox(                    height: 7,                  ),                  _AboutSubTitle(title: d),                  SizedBox(                    height: 7,                  ),                  _AboutSubTitle(title: e),                ],              ),              const SizedBox(                height: 25,              ),              Image.asset(                'assets/images/about_img1.png',                width: double.infinity,                height: 117,              )            ],          )),    );  }}/// TODO:not Usingclass _CustomTextAbout extends StatelessWidget {  final String title;  const _CustomTextAbout({Key? key, required this.title})      : super(key: key);  @override  Widget build(BuildContext context) {    return Text(      title,      maxLines: 5,      style: Theme.of(context).textTheme.headline5?.copyWith(          fontSize: 12,          overflow: TextOverflow.ellipsis,          wordSpacing: 2,          letterSpacing: 1),    );  }}
import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/gestures.dart';import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:intex_mobile_app/core/constants/text.dart';import 'package:intex_mobile_app/core/models/Contacts.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/utils/cart_button.dart';import 'package:intex_mobile_app/core/utils/ling_button.dart';import 'package:intex_mobile_app/core/utils/span_button.dart';class AboutView extends StatelessWidget {  final Contacts contacts;  const AboutView({Key? key, required this.contacts})      : super(key: key);  @override  Widget build(BuildContext context) {    return SingleChildScrollView(      child: Column(        crossAxisAlignment: CrossAxisAlignment.start,        children: [          ///# 1 step          _CompanyQuality(),          SizedBox(            height: 46,            width: double.infinity,            child: ColoredBox(              color: Theme.of(context)                  .bottomAppBarColor                  .withOpacity(0.1),              child: Center(                child: Text(                  fromIntex,                  style: Theme.of(context)                      .textTheme                      .headline4                      ?.copyWith(fontSize: 18),                ),              ),            ),          ),          const SizedBox(            height: 15,          ),          Padding(            padding: const EdgeInsets.symmetric(horizontal: 30),            child: Wrap(              children: [                Text(                  aboutIntex1,                  style: Theme.of(context)                      .textTheme                      .headline3                      ?.copyWith(color: Colors.black),                ),                Text(                  aboutIntex2,                  style: Theme.of(context)                      .textTheme                      .headline3                      ?.copyWith(color: Colors.black),                ),                const _AboutSubTitle(title: a),                const SizedBox(                  height: 3,                ),                const _AboutSubTitle(title: b),                const SizedBox(                  height: 3,                ),                const _AboutSubTitle(title: c),                const SizedBox(                  height: 3,                ),                const _AboutSubTitle(title: d),                const SizedBox(                  height: 3,                ),                const _AboutSubTitle(title: e),              ],            ),          ),          const SizedBox(            height: 24,          ),          CompanyInfo(            contacts: contacts,          )        ],      ),    );  }}class CompanyInfo extends StatelessWidget {  final Contacts contacts;  const CompanyInfo({Key? key, required this.contacts})      : super(key: key);  @override  Widget build(BuildContext context) {    return SizedBox(      height: 980,      width: double.infinity,      child: ColoredBox(        color: Theme.of(context).canvasColor,        child: Padding(          padding: const EdgeInsets.symmetric(horizontal: 22),          child: Column(            crossAxisAlignment: CrossAxisAlignment.start,            children: [              const SizedBox(                height: 44,              ),              Text(                companyname.tr(),                style: Theme.of(context).textTheme.headline1,              ),              const SizedBox(                height: 30,              ),              Text(                aboutIntex1.tr(),                style: Theme.of(context)                    .textTheme                    .headline2                    ?.copyWith(fontWeight: FontWeight.w400),              ),              const SizedBox(                height: 39,              ),              Row(                children: [                  LinkButton(                    onPressed: () {},                    title: 'f',                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                    onPressed: () {},                    title: 'in',                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                    onPressed: () {},                    title: '',                    icon: SvgPicture.asset(                        'assets/icons/instagram.svg'),                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                      onPressed: () {},                      title: '',                      icon: SvgPicture.asset(                          'assets/icons/twitter.svg')),                ],              ),              const SizedBox(                height: 31,              ),              ///#title Address              const _cutomTextWidget(title: link),              const SizedBox(                height: 16,              ),              SpanButton(title:productAbout,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:whyWe,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:cont,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:category,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:popular,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:news,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:discount,onPressed:(){}),              const SizedBox(height: 8,),              const _cutomTextWidget(title: callCentre),              const SizedBox(                height: 16,              ),              SpanButton(title:deliveryAndPayment,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:frequentlyAsked,onPressed:(){}),              const SizedBox(height: 8,),              SpanButton(title:confidential,onPressed:(){}),              const SizedBox(                height: 16,              ),              const _cutomTextWidget(title: address),              const SizedBox(                height: 16,              ),              const SizedBox(                height: 24,              ),              ///#address              Row(                children: [                  Icon(                    Icons.location_on_outlined,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  SizedBox(                    width: MediaQuery.of(context).size.width * .7,                    child: Text(                      contacts.addressRu,                      overflow: TextOverflow.ellipsis,                      maxLines: 2,                    ),                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#number              Row(                children: [                  Icon(                    CupertinoIcons.phone,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  Text(                    numberParser(contacts.phone),                    overflow: TextOverflow.ellipsis,                    maxLines: 4,                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#gmaiadress              Row(                children: [                  Icon(                    Icons.mail_outline,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  const Text(                    gmail,                    overflow: TextOverflow.ellipsis,                    maxLines: 4,                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#working time              Row(                children: [                  Icon(                    CupertinoIcons.clock,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  InkWell(                    onTap: () {},                    child: Text(                      contacts.workRu,                      overflow: TextOverflow.ellipsis,                      maxLines: 4,                    ),                  ),                ],              ),              const SizedBox(                height: 16,              ),              Divider(                color: Theme.of(context).primaryColor,              ),              const SizedBox(                height: 16,              ),              Text(                endPage,                style: Theme.of(context).textTheme.headline3,              )            ],          ),        ),      ),    );  }}class _cutomTextWidget extends StatelessWidget {  final String title;  const _cutomTextWidget({    Key? key,    required this.title,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Text(      title,      style: Theme.of(context)          .textTheme          .headline2          ?.copyWith(fontSize: 18),    );  }}class _AboutSubTitle extends StatelessWidget {  final String title;  const _AboutSubTitle({    Key? key,    required this.title,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Row(      children: [        SizedBox(          height: 20,          width: 20,          child: ClipRRect(            borderRadius: BorderRadius.circular(123123),            child: ColoredBox(              color: Theme.of(context).bottomAppBarColor,              child: const Icon(                CupertinoIcons.checkmark_alt,                color: Colors.white,                size: 16,              ),            ),          ),        ),        const SizedBox(          width: 5,        ),        Text(title),      ],    );  }}class _CustomTextAbout extends StatelessWidget {  final String title;  const _CustomTextAbout({Key? key, required this.title})      : super(key: key);  @override  Widget build(BuildContext context) {    return Text(      title,      maxLines: 5,      style: Theme.of(context).textTheme.headline5?.copyWith(          fontSize: 12,          overflow: TextOverflow.ellipsis,          wordSpacing: 2,          letterSpacing: 1),    );  }}class _AboutTitle extends StatelessWidget {  final String title;  final String subtitle;  final String image;  const _AboutTitle({    Key? key,    required this.title,    required this.subtitle,    required this.image,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Column(      crossAxisAlignment: CrossAxisAlignment.start,      children: [        SizedBox(            height: 220,            width: double.infinity,            child: ClipRRect(                borderRadius: BorderRadius.circular(10),                child: ColoredBox(                  color: const Color(0xfff0f5f9),                  child: Image.asset(                    image,                    fit: BoxFit.contain,                  ),                ))),        const SizedBox(          height: 17,        ),        Text(          title,          style: Theme.of(context).textTheme.headline2,        ),        const SizedBox(          height: 6,        ),        Text(subtitle, style: Theme.of(context).textTheme.headline3),        const SizedBox(          height: 24,        ),      ],    );  }}///#step 1class _CompanyQuality extends StatelessWidget {  @override  Widget build(BuildContext context) {    return Padding(      padding: const EdgeInsets.symmetric(horizontal: 20),      child: Column(        children: [          Text(            aboutclient,            style: Theme.of(context)                .textTheme                .headline2                ?.copyWith(fontSize: 18),          ),          const SizedBox(            height: 51,          ),          const _AboutTitle(              title: aboutEcperience,              subtitle: aboutEcperience1,              image: 'assets/images/experience.png'),          const _AboutTitle(              title: aboutDelivery,              subtitle: aboutDelivery1,              image: 'assets/images/img_delivery.png'),          const _AboutTitle(              title: aboutQuality,              subtitle: aboutQuality1,              image: 'assets/images/quality.png'),          const SizedBox(            height: 30,          ),        ],      ),    );  }}
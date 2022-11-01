import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:intex_mobile_app/core/utils/cart_tile.dart';import 'package:intl_phone_field/intl_phone_field.dart';import 'package:lottie/lottie.dart';import '../../constants/text.dart';import '../buttons/button.dart';///TODO:SUCCESS CompletedFuture cartDialog({Key? key,required final context}) {  return showDialog(      context: context,      builder: (BuildContext context) {        return Padding(          padding: EdgeInsets.symmetric(            vertical: MediaQuery.of(context)                .viewPadding                .top,          ),          child: Dialog(            backgroundColor: Colors.transparent,            insetPadding:            const EdgeInsets.all(10),            child: Container(                width: double.infinity,                height: 573,                decoration: BoxDecoration(                    borderRadius:                    BorderRadius.circular(15),                    color: Theme.of(context)                        .dividerColor),                padding:                const EdgeInsets.symmetric(                    horizontal: 15,                    vertical: 16),                child: Stack(                  children: [                    SingleChildScrollView(                        child: Column(                      children: [                        Center(                          child: Text('Ваш заказ'.tr(),style: Theme.of                            (context).textTheme                              .headline2?.copyWith(fontSize: 25),),                        ),                        CartTile(),                        const Divider(color: Colors.grey,),                        const SizedBox(height: 10,),                        Row(                          children: [                          Text('Общая сумма:',style:  Theme.of                            (context).textTheme.headline3,),                          const SizedBox(width: 16,),                          Text('1 290 000 сум',style: Theme.of                            (context).textTheme.headline3?.copyWith                            (fontWeight: FontWeight.w700),),                        ],),                        const SizedBox(height: 10,),                        const Divider(color: Colors.grey,),                        const SizedBox(height: 24,),                        Text(                          name.tr(),                          style: Theme.of(context)                              .textTheme                              .headline6,                        ),                        const SizedBox(                          height: 12,                        ),                        TextField(                          decoration: InputDecoration(                            hintText: name.tr(),                            hintStyle: const TextStyle(                                color: Colors.grey                            ),                            border: OutlineInputBorder(                                borderRadius:                                BorderRadius.circular(                                    8),                                borderSide: BorderSide(                                    color: Colors                                        .grey.shade300),                                gapPadding: 1),                            focusedBorder:                            OutlineInputBorder(                                borderSide: BorderSide(                                    color: Colors                                        .grey.shade300),                                borderRadius:                                BorderRadius                                    .circular(8),                                gapPadding: 1),                          ),                        ),                        const SizedBox(                          height: 12,                        ),                        Text(                          phoneNumber.tr(),                          style: Theme.of(context)                              .textTheme                              .headline6,                        ),                        const SizedBox(                          height: 12,                        ),                        IntlPhoneField(                          onChanged: (txt) {                            ///TODO number ADd                          },                          showDropdownIcon: true,                          showCursor: true,                          enabled: true,                          flagsButtonPadding: const EdgeInsets.all(8),                          flagsButtonMargin: const EdgeInsets.all(10),                          disableLengthCheck: false,                          dropdownIconPosition:                          IconPosition.trailing,                          dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined),                          invalidNumberMessage: "",                          showCountryFlag: true,                          decoration: InputDecoration(                            focusColor: Colors.grey.shade300,                            border: OutlineInputBorder(                                borderSide: BorderSide(                                    color: Colors                                        .grey.shade300),                                borderRadius:                                BorderRadius                                    .circular(8),                                gapPadding: 1),                            focusedBorder:   OutlineInputBorder(                                borderSide: BorderSide(                                    color: Colors                                        .grey.shade300),                                borderRadius:                                BorderRadius                                    .circular(8),                                gapPadding: 1),                            hintStyle: Theme.of(context).textTheme.headline3,                            hintText: "(90) 123 45 67",                            contentPadding: const EdgeInsets.only(top: 15),                          ),                          initialCountryCode: 'UZ',                        ),                        Text(                          address.tr(),                          style: Theme.of(context)                              .textTheme                              .headline6,                        ),                        const SizedBox(                          height: 12,                        ),                        TextField(                          decoration: InputDecoration(                            hintText: address.tr(),                            hintStyle: const TextStyle(                              color: Colors.grey                            ),                            suffixIcon: Icon(CupertinoIcons                                .location_solid,color: Theme.of                              (context).primaryColor,size: 28,),                            border: OutlineInputBorder(                                borderRadius:                                BorderRadius.circular(                                    8),                                borderSide: BorderSide(                                    color: Colors                                        .grey.shade300),                                gapPadding: 1),                            focusedBorder:                            OutlineInputBorder(                                borderSide: BorderSide(                                    color: Colors                                        .grey.shade300),                                borderRadius:                                BorderRadius                                    .circular(8),                                gapPadding: 1),                          ),                        ),                        const SizedBox(                          height: 16,                        ),                        CustomButton(                          title: cart,                          onPressed: (){                            /// TODO: Cart BUTTON                          },                          color: Theme.of(context)                              .bottomAppBarColor,                        ),                      ],                    )),                    Align(                      alignment:                      Alignment.topRight,                      child: GestureDetector(                        child: ClipRRect(                          borderRadius:                          BorderRadius                              .circular(7),                          child: ColoredBox(                            color: Theme.of(                                context)                                .bottomAppBarColor,                            child: const Icon(                              Icons.close,                              color: Colors.white,                            ),                          ),                        ),                        onTap: () =>                            Navigator.of(context)                                .pop(),                      ),                    ),                  ],                )),          ),        );      });}
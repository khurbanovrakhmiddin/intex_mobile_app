import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:intex_mobile_app/core/service/mapper.dart';class CartTile extends StatelessWidget {  const CartTile({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return SizedBox(      height: 104,      child: Stack(children: [        Row(children: [          const _image(),          Column(           crossAxisAlignment: CrossAxisAlignment.start,            children: [              Expanded(                child: Text(                  'Каркасный прямоугольный '                      'бассейнasdasdasdasdasjkdkjsadkasdasd',                  style: Theme.of(context).textTheme.headline3,                  overflow: TextOverflow.ellipsis,                  maxLines: 2,                ),              ),              Text(                '220х150х60см, 1662л',                style: Theme.of(context)                    .textTheme                    .headline2                    ?.copyWith(                  fontSize: 12,                ),              ),              Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [                  SizedBox(                      width: 75,                      child: ClipRRect(                          borderRadius: BorderRadius.circular(5),                          child: ColoredBox(                            color: Colors.grey.shade300,                            child: Row(                              mainAxisAlignment: MainAxisAlignment.spaceBetween,                              children: [                                _CartButton(icon:const Icon(Icons.add),tap:() {}),                                Text('1',style: Theme.of(context)                                    .textTheme.headline3,),                                _CartButton(icon:const Icon(Icons.remove),tap:                                    () {}),                              ],                            ),                          ))),                ],),              // Row(              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,              //   mainAxisSize: MainAxisSize.min,              //   children: [              //   ],              // ),            ],          ),        ],),        const Align(          alignment: Alignment.topRight,          child:     _CloseButton(),        ),        Align(          alignment: Alignment.bottomRight,          child: Text(            priceParser(                1200000, context.locale.languageCode),            style: Theme.of(context)                .textTheme                .headline3                ?.copyWith(              fontSize: 15,              color: Theme.of(context)                  .primaryColor,              fontWeight:              FontWeight.w700,            ),          ),        ),],),    );  }}class _CartButton extends StatelessWidget {  final Widget icon;  final tap;  const _CartButton({    Key? key, required this.icon,required this.tap,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return ColoredBox(color: Colors.grey.shade100,child:    GestureDetector(        onTap: tap,        child: icon),);  }}class _CloseButton extends StatelessWidget {  const _CloseButton({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return GestureDetector(      child: ClipRRect(        borderRadius:        BorderRadius            .circular(7),        child: ColoredBox(          color: Colors.grey.shade300,          child:  Icon(            Icons.close,            color: Theme.of(context).primaryColor,          ),        ),      ),      onTap: () =>          Navigator.of(context)              .pop(),    );  }}class _image extends StatelessWidget {  const _image({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return SizedBox(      width: 76,      height: 76,      child: ClipRRect(        borderRadius: BorderRadius.circular(8),        child: Image.network(          'https://intex.uz/image/cache/webp/'          'catalog/i/cp/lb/b17b7239657db9ea50dd2a112f155fed'          '-700x500.webp',        ),      ),    );  }}
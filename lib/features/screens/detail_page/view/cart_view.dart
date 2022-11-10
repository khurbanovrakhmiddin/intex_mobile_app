import 'package:cached_network_image/cached_network_image.dart';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:intex_mobile_app/core/constants/text.dart';import 'package:intex_mobile_app/core/constants/theme.dart';import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/service/local_service.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/utils/buttons/button.dart';import 'package:intex_mobile_app/features/screens/main_page/bloc/main_bloc.dart';import 'package:intex_mobile_app/features/screens/main_page/view/main_page.dart';class sss extends StatelessWidget {final list;  const sss({Key? key, this.list}) : super(key: key);  @override  Widget build(BuildContext context) {    var orient = MediaQuery.of(context).orientation.name;  return  SliverGrid(      gridDelegate:orient == 'portrait'          ? const SliverGridDelegateWithFixedCrossAxisCount(        crossAxisCount: 2,        mainAxisSpacing: 29,        crossAxisSpacing: 10,        childAspectRatio: 0.5,      )          : const SliverGridDelegateWithFixedCrossAxisCount(        crossAxisCount: 4,        mainAxisSpacing: 29,        crossAxisSpacing: 10,        childAspectRatio: 0.6,      ),      delegate: SliverChildBuilderDelegate(            (BuildContext context, int index) {              String localLang = context.locale.languageCode;              Catalog catalog = list[index ];              return Material(                type: MaterialType.card,                elevation: 10,                shadowColor: Colors.white,                color: Theme.of(context).dividerColor,                borderRadius:  BorderRadius.circular(10),                child: Stack(                  children: [                    Padding(                      padding: const EdgeInsets.symmetric(                          horizontal: 8, vertical: 8),                      child: Column(                        crossAxisAlignment: CrossAxisAlignment.start,                        mainAxisAlignment: MainAxisAlignment.spaceBetween,                        children: [                          CachedNetworkImage(                            fit: BoxFit.cover,                            height: 150,                            width: 220,                            imageUrl:                            "https://img.gumtree.co.za/api/v1/za-ads/images/64/6442f53b-2528-4f1c-a4e3-900d87dda01f?rule=s-I3.auto",                            imageBuilder: (context, imageProvider) =>                                Image(                                  image: imageProvider,                                  fit: BoxFit.contain,                                ),                            placeholder: (context, url) =>                            const LinearProgressIndicator(),                            errorWidget: (context, url, error) =>                            const Icon(Icons.error),                          ),                          Divider(                              height: 1, color: Colors.grey.shade400),                          ///TODO: Lang Check                          Text(                            localLang == Lang.ru.name?catalog.nameRu                                :localLang == Lang.uz                                .name?catalog.nameUz:catalog.nameEn,                            // "Каркасный прямоугольный "                            // "бассейнКаркасный прямоугольный бассейн ",                            style: Theme.of(context)                                .textTheme                                .headline2                                ?.copyWith(                                color: Theme.of(context)                                    .bottomAppBarColor),                            overflow: TextOverflow.ellipsis,                            maxLines: 3,                          ),                          const SizedBox.shrink(),                          const SizedBox.shrink(),                          Column(                            crossAxisAlignment:                            CrossAxisAlignment.start,                            children: [                              const SizedBox(                                height: 6,                              ),                              Text(                                '220х150х60см, 1662л',                                style: Theme.of(context)                                    .textTheme                                    .headline2                                    ?.copyWith(                                  fontSize: 12,                                ),                              ),                              const SizedBox(                                height: 6,                              ),                              Text(                                priceParser(catalog.price, localLang),                                style: Theme.of(context)                                    .textTheme                                    .headline2                                    ?.copyWith(                                    fontSize: 12,                                    decoration: TextDecoration                                        .lineThrough,                                    decorationColor: Colors.red,                                    color: Colors.grey),                              ),                              Text(                                priceParser(catalog.discountPrice,localLang),                                style: Theme.of(context)                                    .textTheme                                    .headline3                                    ?.copyWith(                                  fontSize: 15,                                  color: Theme.of(context)                                      .primaryColor,                                  fontWeight: FontWeight.w700,                                ),                              ),                              const SizedBox(                                height: 8,                              ),                            ],                          ),                          CustomButton(                            title: cart,                            onPressed: () {},                            color:                            Theme.of(context).bottomAppBarColor,                          ),                        ],                      ),                    ),                    Visibility(                      visible: true,                      child: Padding(                          padding: const EdgeInsets.only(top: 16),                          child: Align(                              alignment: Alignment.topLeft,                              child: SizedBox(                                width: 107,                                height: 30,                                child: ClipRRect(                                  borderRadius:                                  const BorderRadius.only(                                    bottomRight: Radius.circular(10),                                    topRight: Radius.circular(10),),                                  child:                                  ColoredBox(                                      color: saleType(TypeSale.discount),                                      child: Center(                                        child: Text(                                          xitProdaj,                                          style: Theme.of(context)                                              .textTheme                                              .headline5,                                        ),                                      )),                                ),))                      ),                    ),                    Visibility(                      visible: true,                      child: Padding(                          padding: const EdgeInsets.only(top: 16),                          child: Align(                              alignment: Alignment.topLeft,                              child: SizedBox(                                width: 107,                                height: 30,                                child: ClipRRect(                                  borderRadius:                                  const BorderRadius.only(                                    bottomRight: Radius.circular(10),                                    topRight: Radius.circular(10),),                                  child:                                  ColoredBox(                                      color: saleType(TypeSale.discount),                                      child: Center(                                        child: Text(                                          xitProdaj,                                          style: Theme.of(context)                                              .textTheme                                              .headline5,                                        ),                                      )),                                ),))                      ),                    ),                    Visibility(                      visible: true,                      child: Padding(                          padding: const EdgeInsets.only(top: 16),                          child: Align(                              alignment: Alignment.topLeft,                              child: SizedBox(                                width: 107,                                height: 30,                                child: ClipRRect(                                  borderRadius:                                  const BorderRadius.only(                                    bottomRight: Radius.circular(10),                                    topRight: Radius.circular(10),),                                  child:                                  ColoredBox(                                      color: saleType(TypeSale.popular),                                      child: Center(                                        child: Text(                                          xitProdaj,                                          style: Theme.of(context)                                              .textTheme                                              .headline5,                                        ),                                      )),                                ),))                      ),                    ),                  ],                ),              );        },        childCount:  list.length,      ),    );   return   GridView.builder(      keyboardDismissBehavior:      ScrollViewKeyboardDismissBehavior.onDrag,      padding:      const EdgeInsets.symmetric(horizontal: 16, vertical: 29),      itemCount: list.length,      gridDelegate: orient == 'portrait'          ? const SliverGridDelegateWithFixedCrossAxisCount(        crossAxisCount: 2,        mainAxisSpacing: 29,        crossAxisSpacing: 10,        childAspectRatio: 0.5,      )          : const SliverGridDelegateWithFixedCrossAxisCount(        crossAxisCount: 4,        mainAxisSpacing: 29,        crossAxisSpacing: 10,        childAspectRatio: 0.6,      ),      itemBuilder: (BuildContext context, int index) {        String localLang = context.locale.languageCode;        Catalog catalog = list[index];        return Material(          type: MaterialType.card,          elevation: 10,          shadowColor: Colors.white,          color: Theme.of(context).dividerColor,          borderRadius:  BorderRadius.circular(10),          child: Stack(            children: [              Padding(                padding: const EdgeInsets.symmetric(                    horizontal: 8, vertical: 8),                child: Column(                  crossAxisAlignment: CrossAxisAlignment.start,                  mainAxisAlignment: MainAxisAlignment.spaceBetween,                  children: [                    CachedNetworkImage(                      fit: BoxFit.cover,                      height: 150,                      width: 220,                      imageUrl:                      "https://img.gumtree.co.za/api/v1/za-ads/images/64/6442f53b-2528-4f1c-a4e3-900d87dda01f?rule=s-I3.auto",                      imageBuilder: (context, imageProvider) =>                          Image(                            image: imageProvider,                            fit: BoxFit.contain,                          ),                      placeholder: (context, url) =>                      const LinearProgressIndicator(),                      errorWidget: (context, url, error) =>                      const Icon(Icons.error),                    ),                    Divider(                        height: 1, color: Colors.grey.shade400),                    ///TODO: Lang Check                    Text(                      localLang == Lang.ru.name?catalog.nameRu                          :localLang == Lang.uz                          .name?catalog.nameUz:catalog.nameEn,                      // "Каркасный прямоугольный "                      // "бассейнКаркасный прямоугольный бассейн ",                      style: Theme.of(context)                          .textTheme                          .headline2                          ?.copyWith(                          color: Theme.of(context)                              .bottomAppBarColor),                      overflow: TextOverflow.ellipsis,                      maxLines: 3,                    ),                    const SizedBox.shrink(),                    const SizedBox.shrink(),                    Column(                      crossAxisAlignment:                      CrossAxisAlignment.start,                      children: [                        const SizedBox(                          height: 6,                        ),                        Text(                          '220х150х60см, 1662л',                          style: Theme.of(context)                              .textTheme                              .headline2                              ?.copyWith(                            fontSize: 12,                          ),                        ),                        const SizedBox(                          height: 6,                        ),                        Text(                          priceParser(catalog.price, localLang),                          style: Theme.of(context)                              .textTheme                              .headline2                              ?.copyWith(                              fontSize: 12,                              decoration: TextDecoration                                  .lineThrough,                              decorationColor: Colors.red,                              color: Colors.grey),                        ),                        Text(                          priceParser(catalog.discountPrice,localLang),                          style: Theme.of(context)                              .textTheme                              .headline3                              ?.copyWith(                            fontSize: 15,                            color: Theme.of(context)                                .primaryColor,                            fontWeight: FontWeight.w700,                          ),                        ),                        const SizedBox(                          height: 8,                        ),                      ],                    ),                    CustomButton(                      title: cart,                      onPressed: () {},                      color:                      Theme.of(context).bottomAppBarColor,                    ),                  ],                ),              ),              Visibility(                visible: true,                child: Padding(                    padding: const EdgeInsets.only(top: 16),                    child: Align(                        alignment: Alignment.topLeft,                        child: SizedBox(                          width: 107,                          height: 30,                          child: ClipRRect(                            borderRadius:                            const BorderRadius.only(                              bottomRight: Radius.circular(10),                              topRight: Radius.circular(10),),                            child:                            ColoredBox(                                color: saleType(TypeSale.discount),                                child: Center(                                  child: Text(                                    xitProdaj,                                    style: Theme.of(context)                                        .textTheme                                        .headline5,                                  ),                                )),                          ),))                ),              ),              Visibility(                visible: true,                child: Padding(                    padding: const EdgeInsets.only(top: 16),                    child: Align(                        alignment: Alignment.topLeft,                        child: SizedBox(                          width: 107,                          height: 30,                          child: ClipRRect(                            borderRadius:                            const BorderRadius.only(                              bottomRight: Radius.circular(10),                              topRight: Radius.circular(10),),                            child:                            ColoredBox(                                color: saleType(TypeSale.discount),                                child: Center(                                  child: Text(                                    xitProdaj,                                    style: Theme.of(context)                                        .textTheme                                        .headline5,                                  ),                                )),                          ),))                ),              ),              Visibility(                visible: true,                child: Padding(                    padding: const EdgeInsets.only(top: 16),                    child: Align(                        alignment: Alignment.topLeft,                        child: SizedBox(                          width: 107,                          height: 30,                          child: ClipRRect(                            borderRadius:                            const BorderRadius.only(                              bottomRight: Radius.circular(10),                              topRight: Radius.circular(10),),                            child:                            ColoredBox(                                color: saleType(TypeSale.popular),                                child: Center(                                  child: Text(                                    xitProdaj,                                    style: Theme.of(context)                                        .textTheme                                        .headline5,                                  ),                                )),                          ),))                ),              ),            ],          ),        );      },    );    // body: SingleChildScrollView(    //     child: Column(    //   children: [    //    //    //     Padding(    //         padding: const EdgeInsets.symmetric(    //             horizontal: 20, vertical: 16),    //         child: SizedBox(    //           width: double.infinity,    //           child: Row(    //             children: [    //               Text(    //                 companyname,    //                 style: Theme.of(context).textTheme.headline1,    //               ),    //               const Spacer(),    //               IconButton(    //                   onPressed: () {},    //                   icon: SvgPicture.asset(    //                     'assets/icons/call.svg',    //                     color: Theme.of(context).primaryColor,    //                   ))    //             ],    //           ),    //         )),    //    //    //     const Divider(    //       color: Colors.grey,    //     ),    //     SizedBox(    //       width: double.infinity,    //       child: ColoredBox(    //         color: Theme.of(context).splashColor,    //         child: Padding(    //             padding: const EdgeInsets.symmetric(    //                 horizontal: 14, vertical: 16),    //             child: Row(    //               children: [    //                 TextButton(    //                   onPressed: () {    //                     ///TODO: appbar MENU    //                   },    //                   child: SvgPicture.asset(    //                     'assets/icons/menu.svg',    //                   ),    //                 ),    //                 SizedBox(    //                   height: 42,    //                   width: MediaQuery.of(context).size.width * .6,    //                   child: ClipRRect(    //                     borderRadius: BorderRadius.circular(6),    //                     child: ColoredBox(    //                       color: Theme.of(context).dividerColor,    //                       child: TextField(    //                         decoration: InputDecoration(    //                           prefixIcon: IconButton(    //                             icon: const Icon(Icons.search),    //                             color:    //                                 Theme.of(context).primaryColor,    //                             onPressed: () {},    //                           ),    //                           contentPadding:    //                               const EdgeInsets.only(top: 6),    //                           border: InputBorder.none,    //                         ),    //                       ),    //                     ),    //                   ),    //                 ),    //                 const SizedBox(    //                   width: 10,    //                 ),    //                 LinkButton(    //                     cartButton: true,    //                     onPressed: () {},    //                     title: '',    //                     icon: SvgPicture.asset(    //                       'assets/icons/cart.svg',    //                       fit: BoxFit.cover,    //                     )),    //               ],    //             )),    //       ),    //     ),    //     AboutView(    //       contacts: Contacts.fromJson({    //         "id": 1,    //         "phone": "99956565569",    //         'email': "intex@gmail.com",    //         "address_ru":    //             "Улица Пахлавона Махмуда, Яшнабадский район, город Ташкент",    //         "address_uz":    //             "Toshkent shahri, Yashnobod tumani, Paxlavon Mahmud ko‘chasi",    //         "address_en":    //             "Toshkent shahri, Yashnobod tumani, Paxlavon "    //                 "Mahmud ko‘chasi",    //         "work_uz": "Ish kunlari: 09:00 - 22:00.",    //         "work_en": "Ish kunlari: 09:00 - 22:00.",    //         "work_ru": "Будние дни: 09:00 - 22:00",    //         "telegram": "https://t.me/basseinintexuzb",    //         "instagram":    //             "https://www.instagram.com/intex-market_uz/"    //       }),    //     )    //   ],    // )),  }}// class De extends StatelessWidget {//   const CustomCard({Key? key}) : super(key: key);////   @override//   Widget build(BuildContext context) {//     var size = MediaQuery.of(context).size;//     return Scaffold(//       backgroundColor: Colors.red,//       body: BackdropFilter(//         filter: ImageFilter.blur(//           sigmaX: 6,//           sigmaY: 6//         ),//         child: Padding(//           padding: EdgeInsets.symmetric(//               vertical: size.height * .2, horizontal: size.width * .06),//           child: SizedBox(//             height: double.infinity,//             width: double.infinity,//             child: ClipRRect(//               borderRadius: BorderRadius.circular(35),//               child: ColoredBox(//                 color: const Color.fromRGBO(248, 248, 248, 1),//                 child: Column(//                   children: [//                     Padding(//                       padding: const EdgeInsets.only(right: 12),//                       child: Align(//                         alignment: Alignment.topRight,//                         child: IconButton(//                           icon: const Icon(//                             Icons.close,//                             color: Colors.grey,//                             size: 35,//                           ),//                           onPressed: () {//                             print('pressed close');//                             showDialog(context: context, builder://                                 (context){//                               return BackdropFilter(//                                 filter: ImageFilter.blur(//                                     sigmaX: 6,//                                     sigmaY: 6//                                 ),//                                 child: Padding(//                                   padding: EdgeInsets.symmetric(//                                       vertical: size.height * .2, horizontal: size.width * .06),//                                   child: SizedBox(//                                     height: double.infinity,//                                     width: double.infinity,//                                     child: ClipRRect(//                                       borderRadius: BorderRadius.circular(35),//                                       child: ColoredBox(//                                         color: const Color.fromRGBO(248, 248, 248, 1),//                                         child: Column(//                                           children: [//                                             Padding(//                                               padding: const EdgeInsets.only(right: 12),//                                               child: Align(//                                                 alignment: Alignment.topRight,//                                                 child: IconButton(//                                                   icon: const Icon(//                                                     Icons.close,//                                                     color: Colors.grey,//                                                     size: 35,//                                                   ),//                                                   onPressed: () {////                                                   },//                                                 ),//                                               ),//                                             ),//                                             SvgPicture.asset('assets/icon/operator.svg'),//                                             Container(//                                               margin:  EdgeInsets.symmetric(horizontal://                                               size.width * .09),//                                               decoration: BoxDecoration(//                                                   boxShadow: const [//                                                     BoxShadow(//                                                         blurRadius: 14,//                                                         color: Color.fromRGBO(0, 0, 0, 0.25))//                                                   ],//                                                   borderRadius: BorderRadius.circular(17),//                                                   color: Colors.white),//                                               child: const TextField(//                                                 decoration: InputDecoration(//                                                   border: InputBorder.none,//                                                 ),//                                               ),//                                             ),//                                           ],//                                         ),//                                       ),//                                     ),//                                   ),//                                 ),//                               );//                                 });//                           },//                         ),//                       ),//                     ),//                     SvgPicture.asset('assets/icon/operator.svg'),//                     Container(//                       margin:  EdgeInsets.symmetric(horizontal://                       size.width * .09),//                       decoration: BoxDecoration(//                           boxShadow: const [//                             BoxShadow(//                               blurRadius: 14,//                                 color: Color.fromRGBO(0, 0, 0, 0.25))//                           ],//                           borderRadius: BorderRadius.circular(17),//                           color: Colors.white),//                       child: const TextField(//                         decoration: InputDecoration(//                           border: InputBorder.none,//                         ),//                       ),//                     ),//                   ],//                 ),//               ),//             ),//           ),//         ),//       ),//     );//   }// }
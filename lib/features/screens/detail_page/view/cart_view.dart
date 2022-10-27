import 'dart:ui';import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:intex_mobile_app/core/constants/text.dart';import 'package:intex_mobile_app/core/models/Contacts.dart';import 'package:intex_mobile_app/features/screens/main_page/utils/about_view.dart';class DetailPage extends StatelessWidget {  const DetailPage({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        backgroundColor: Theme.of(context).bottomAppBarColor,        toolbarHeight: 0,      ),      body: SingleChildScrollView(child: Column(children: [        Padding(            padding: const EdgeInsets.symmetric(horizontal: 20,                vertical: 16),                        child: SizedBox(          width: double.infinity,          child: Row(            children: [            Text(              companyname,              style: Theme.of(context).textTheme.headline1,            ),            const Spacer(),            IconButton(onPressed: (){}, icon: SvgPicture.asset              ('assets/icons/call.svg',color: Theme.of(context)                .primaryColor,))          ],),        )),        const Divider(color: Colors.grey,),        SizedBox(          width: double.infinity,          child: ColoredBox(            color: Theme.of(context).splashColor,            child: Padding(                padding: const EdgeInsets.symmetric(horizontal: 20,                    vertical: 16),                child: Row(                  children: [                TextButton(onPressed: (){}, child: SvgPicture.asset                  ('assets/icons/menu.svg',),),                 const SizedBox(width: 10,),                 SizedBox(height:42 ,width: MediaQuery.of(context).size                 .width * .6,child:  ClipRRect(                   borderRadius: BorderRadius.circular(6),                   child: ColoredBox(                   color: Theme.of                 (context).dividerColor,                   child: TextField(                   decoration: InputDecoration(                     prefixIcon: IconButton(icon: const Icon(Icons.search),color:                     Theme.of(context).primaryColor, onPressed: () {  },),                     contentPadding: const EdgeInsets.only(top: 6),                     border: InputBorder.none,                   ),                 ),                 ),),),                const SizedBox(width: 10,),                ],)),          ),        ),        AboutView(contacts: Contacts.fromJson(  {          "id": 1,          "phone": "99956565569",          'email':"intex@gmail.com",          "address_ru": "Улица Пахлавона Махмуда, Яшнабадский район, город Ташкент",          "address_uz": "Toshkent shahri, Yashnobod tumani, Paxlavon Mahmud ko‘chasi",          "address_en": "Toshkent shahri, Yashnobod tumani, Paxlavon "              "Mahmud ko‘chasi",          "work_uz": "Ish kunlari: 09:00 - 22:00.",          "work_en": "Ish kunlari: 09:00 - 22:00.",          "work_ru": "Будние дни: 09:00 - 22:00",          "telegram": "https://t.me/basseinintexuzb",          "instagram": "https://www.instagram.com/intex-market_uz/"        }),)      ],)),    );  }}// class De extends StatelessWidget {//   const CustomCard({Key? key}) : super(key: key);////   @override//   Widget build(BuildContext context) {//     var size = MediaQuery.of(context).size;//     return Scaffold(//       backgroundColor: Colors.red,//       body: BackdropFilter(//         filter: ImageFilter.blur(//           sigmaX: 6,//           sigmaY: 6//         ),//         child: Padding(//           padding: EdgeInsets.symmetric(//               vertical: size.height * .2, horizontal: size.width * .06),//           child: SizedBox(//             height: double.infinity,//             width: double.infinity,//             child: ClipRRect(//               borderRadius: BorderRadius.circular(35),//               child: ColoredBox(//                 color: const Color.fromRGBO(248, 248, 248, 1),//                 child: Column(//                   children: [//                     Padding(//                       padding: const EdgeInsets.only(right: 12),//                       child: Align(//                         alignment: Alignment.topRight,//                         child: IconButton(//                           icon: const Icon(//                             Icons.close,//                             color: Colors.grey,//                             size: 35,//                           ),//                           onPressed: () {//                             print('pressed close');//                             showDialog(context: context, builder://                                 (context){//                               return BackdropFilter(//                                 filter: ImageFilter.blur(//                                     sigmaX: 6,//                                     sigmaY: 6//                                 ),//                                 child: Padding(//                                   padding: EdgeInsets.symmetric(//                                       vertical: size.height * .2, horizontal: size.width * .06),//                                   child: SizedBox(//                                     height: double.infinity,//                                     width: double.infinity,//                                     child: ClipRRect(//                                       borderRadius: BorderRadius.circular(35),//                                       child: ColoredBox(//                                         color: const Color.fromRGBO(248, 248, 248, 1),//                                         child: Column(//                                           children: [//                                             Padding(//                                               padding: const EdgeInsets.only(right: 12),//                                               child: Align(//                                                 alignment: Alignment.topRight,//                                                 child: IconButton(//                                                   icon: const Icon(//                                                     Icons.close,//                                                     color: Colors.grey,//                                                     size: 35,//                                                   ),//                                                   onPressed: () {////                                                   },//                                                 ),//                                               ),//                                             ),//                                             SvgPicture.asset('assets/icon/operator.svg'),//                                             Container(//                                               margin:  EdgeInsets.symmetric(horizontal://                                               size.width * .09),//                                               decoration: BoxDecoration(//                                                   boxShadow: const [//                                                     BoxShadow(//                                                         blurRadius: 14,//                                                         color: Color.fromRGBO(0, 0, 0, 0.25))//                                                   ],//                                                   borderRadius: BorderRadius.circular(17),//                                                   color: Colors.white),//                                               child: const TextField(//                                                 decoration: InputDecoration(//                                                   border: InputBorder.none,//                                                 ),//                                               ),//                                             ),//                                           ],//                                         ),//                                       ),//                                     ),//                                   ),//                                 ),//                               );//                                 });//                           },//                         ),//                       ),//                     ),//                     SvgPicture.asset('assets/icon/operator.svg'),//                     Container(//                       margin:  EdgeInsets.symmetric(horizontal://                       size.width * .09),//                       decoration: BoxDecoration(//                           boxShadow: const [//                             BoxShadow(//                               blurRadius: 14,//                                 color: Color.fromRGBO(0, 0, 0, 0.25))//                           ],//                           borderRadius: BorderRadius.circular(17),//                           color: Colors.white),//                       child: const TextField(//                         decoration: InputDecoration(//                           border: InputBorder.none,//                         ),//                       ),//                     ),//                   ],//                 ),//               ),//             ),//           ),//         ),//       ),//     );//   }// }
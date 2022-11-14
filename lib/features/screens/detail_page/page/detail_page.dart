import 'package:cached_network_image/cached_network_image.dart';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:flutter_svg/svg.dart';import 'package:intex_mobile_app/core/constants/text.dart';import 'package:intex_mobile_app/core/constants/theme.dart';import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/models/Category.dart';import 'package:intex_mobile_app/core/service/url_launch.dart';import 'package:intex_mobile_app/core/utils/buttons/button.dart';import 'package:intex_mobile_app/core/utils/buttons/link_button.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:intex_mobile_app/core/service/local_service.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/utils/buttons/request_button.dart';import 'package:intex_mobile_app/core/utils/custom_drawer.dart';import 'package:intex_mobile_app/core/utils/dialogs/cart_dialog.dart';import 'package:intex_mobile_app/core/utils/loading_image_seleton.dart';import 'package:intex_mobile_app/core/utils/loading_page_skeleton.dart';import 'package:intex_mobile_app/features/screens/detail_page/bloc/cart_bloc.dart';import 'package:intex_mobile_app/features/screens/main_page/bloc/main_bloc.dart';import '../../conect_page/view/connect_check/view/connect_view.dart';class DetailPage extends StatelessWidget {  final Category category;  const DetailPage({Key? key, required this.category})      : super(key: key);  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => CartBloc(category)..add(LoadingEvent()),      child: _DetailPage(),    );  }}class _DetailPage extends StatelessWidget {  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();  _DetailPage({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    final contacts = context.read<MainBloc>().repository.contacts();    final bloc = context.read<CartBloc>();    return Scaffold(        key: _key,        drawerEnableOpenDragGesture: false,        backgroundColor: Theme.of(context).dividerColor,        appBar: AppBar(          backgroundColor: Theme.of(context).bottomAppBarColor,          toolbarHeight: 0,        ),        drawer: const CustomDrawer(),        body: GestureDetector(          behavior: HitTestBehavior.opaque,          onPanDown: (_) {            FocusScope.of(context).requestFocus(FocusNode());          },          child: CustomScrollView(            slivers: [       //       const WarningWidgetValueNotifier(),              SliverToBoxAdapter(                child: ColoredBox(                  color: Theme.of(context).splashColor,                  child: Padding(                    padding: const EdgeInsets.symmetric(                        horizontal: 20, vertical: 16),                    child: SizedBox(                      width: double.infinity,                      child: Row(                        children: [                          Text(                            companyname,                            style:                                Theme.of(context).textTheme.headline1,                          ),                          const Spacer(),                          IconButton(                              onPressed: () async {                                print('launc');                                await URL                                    .launchPhoneCall(contacts.phone);                                print('launc');                              },                              icon: SvgPicture.asset(                                'assets/icons/call.svg',                                color: Theme.of(context).primaryColor,                              ))                        ],                      ),                    ),                  ),                ),              ),              const SliverToBoxAdapter(                child: Divider(                  height: 1,                  color: Colors.grey,                ),              ),              SliverAppBar(                centerTitle: false,                backgroundColor: Theme.of(context).splashColor,                pinned: true,                leading: Padding(                  padding: const EdgeInsets.only(left: 16),                  child: TextButton(                    onPressed: () {                      ///TODO: appbar MENU                      _key.currentState?.openDrawer();                    },                    child: SvgPicture.asset(                      'assets/icons/menu.svg',                    ),                  ),                ),                title: ColoredBox(                  color: Theme.of(context).splashColor,                  child: Padding(                    padding: const EdgeInsets.symmetric(                        horizontal: 14, vertical: 16),                    child: SizedBox(                      height: 42,                      width: double.infinity,                      child: ClipRRect(                        borderRadius: BorderRadius.circular(6),                        child: ColoredBox(                          color: Theme.of(context).dividerColor,                          child: TextField(                            decoration: InputDecoration(                              prefixIcon: IconButton(                                icon: const Icon(Icons.search),                                color: Theme.of(context).primaryColor,                                onPressed: () {},                              ),                              contentPadding:                                  const EdgeInsets.only(top: 6),                              border: InputBorder.none,                            ),                          ),                        ),                      ),                    ),                  ),                ),              ),              SliverToBoxAdapter(                child: Padding(                  padding: const EdgeInsets.symmetric(                      vertical: 16, horizontal: 16),                  child: Row(                    children: [                      TextButton(                        onPressed: () => Navigator.of(context)                            .popUntil((route) => route.isFirst),                        child: Text(                          home.tr().toString(),                          style: Theme.of(context)                              .textTheme                              .headline3                              ?.copyWith(                                  color:                                      Theme.of(context).primaryColor),                        ),                      ),                      const SizedBox(                        width: 16,                      ),                      const Icon(Icons.navigate_next_rounded),                      const SizedBox(                        width: 16,                      ),                      Text(                        context.locale.languageCode == 'ru'                            ? bloc.category.category_ru                            : context.locale.languageCode == 'uz'                                ? bloc.category.category_uz                                : bloc.category.category_en,                        style: Theme.of(context).textTheme.headline3,                      ),                    ],                  ),                ),              ),              SliverToBoxAdapter(                child: Padding(                  padding: const EdgeInsets.only(                      left: 16, right: 16, top: 6, bottom: 29),                  child: Text(                    context.locale.languageCode == 'ru'                        ? bloc.category.category_ru                        : context.locale.languageCode == 'uz'                            ? bloc.category.category_uz                            : bloc.category.category_en,                    style: Theme.of(context)                        .textTheme                        .headline2                        ?.copyWith(fontSize: 18),                  ),                ),              ),              const _CatalogPage(),              const SliverToBoxAdapter(child: SizedBox(height: 32,),),              SliverToBoxAdapter(                child: CustomButtonGetAll(onPressed: ()=>bloc.add(LoadingEvent()),),              ),              const SliverToBoxAdapter(                  child: SizedBox(                height: 80,              )),              SliverToBoxAdapter(                child: CompanyInfo(                  contacts: contacts,                ),              ),            ],          ),        ));  }}class _CatalogPage extends StatelessWidget {  const _CatalogPage({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return BlocBuilder<CartBloc, CartState>(        builder: (context, state) {      var orient = MediaQuery.of(context).orientation.name;      return SliverPadding(        padding: const EdgeInsets.symmetric(horizontal: 16),        sliver: state is LoadedCatalogState            ? SliverGrid(                key: const PageStorageKey<String>('category_portrat'),                gridDelegate: orient == 'portrait'                    ? const SliverGridDelegateWithFixedCrossAxisCount(                        crossAxisCount: 2,                        mainAxisSpacing: 25,                        crossAxisSpacing: 10,                        childAspectRatio: 0.5,                      )                    : const SliverGridDelegateWithFixedCrossAxisCount(                        crossAxisCount: 4,                        mainAxisSpacing: 29,                        crossAxisSpacing: 16,                        childAspectRatio: 0.6,                      ),                delegate: SliverChildBuilderDelegate(                  (BuildContext context, int index) {                    String localLang = context.locale.languageCode;                    if (state is Loading) {                      return const LoadingPage();                    }                    Catalog catalog = state.catalog[index];                    return Container(                      decoration: BoxDecoration(                        boxShadow: const [                          BoxShadow(                            color: Color.fromRGBO(60, 60, 60, 0.1),                            blurRadius: 16,                            spreadRadius: 1,                            offset: Offset(2, 12),                          )                        ],                        color: Theme.of(context).dividerColor,                        borderRadius: BorderRadius.circular(10),                      ),                      child: Stack(                        children: [                          Padding(                            padding: const EdgeInsets.symmetric(                                horizontal: 8, vertical: 8),                            child: Column(                              crossAxisAlignment:                                  CrossAxisAlignment.start,                              mainAxisAlignment:                                  MainAxisAlignment.spaceBetween,                              children: [                                CachedNetworkImage(                                  fit: BoxFit.cover,                                  height: 150,                                  width: 220,                                  imageUrl:                                      "https://img.gumtree.co.za/api/v1/za-ads/images/64/6442f53b-2528-4f1c-a4e3-900d87dda01f?rule=s-I3.auto",                                  imageBuilder:                                      (context, imageProvider) =>                                          Image(                                    image: imageProvider,                                    fit: BoxFit.contain,                                  ),                                  placeholder: (context, url) =>                                      const PlaceHolder(),                                  errorWidget:                                      (context, url, error) =>                                          const Icon(Icons.error),                                ),                                Divider(                                    height: 1,                                    color: Colors.grey.shade400),                                ///TODO: Lang Check                                Text(                                  context.locale.languageCode == 'ru'                                      ? catalog.nameRu                                      : context.locale.languageCode ==                                              'uz'                                          ? catalog.nameUz                                          : catalog.nameEn,                                  style: Theme.of(context)                                      .textTheme                                      .headline2                                      ?.copyWith(                                          color: Theme.of(context)                                              .bottomAppBarColor),                                  overflow: TextOverflow.ellipsis,                                  maxLines: 3,                                ),                                const SizedBox.shrink(),                                const SizedBox.shrink(),                                Column(                                  crossAxisAlignment:                                      CrossAxisAlignment.start,                                  children: [                                    const SizedBox(                                      height: 6,                                    ),                                    Text(                                      '220х150х60см, 1662л',                                      style: Theme.of(context)                                          .textTheme                                          .headline2                                          ?.copyWith(                                            fontSize: 12,                                          ),                                    ),                                    const SizedBox(                                      height: 6,                                    ),                                    Text(                                      priceParser(                                          catalog.discountPrice,                                          localLang),                                      style: Theme.of(context)                                          .textTheme                                          .headline2                                          ?.copyWith(                                              fontSize: 12,                                              decoration:                                                  TextDecoration                                                      .lineThrough,                                              decorationColor:                                                  Colors.red,                                              color: Colors.grey),                                    ),                                    Text(                                      priceParser(                                          catalog.price, localLang),                                      style: Theme.of(context)                                          .textTheme                                          .headline3                                          ?.copyWith(                                            fontSize: 15,                                            color: Theme.of(context)                                                .primaryColor,                                            fontWeight:                                                FontWeight.w700,                                          ),                                    ),                                    const SizedBox(                                      height: 8,                                    ),                                  ],                                ),                                CustomButton(                                  title: cart,                                  onPressed: ()=>cartDialog                                    (context: context, catalog: catalog),                                  color: Theme.of(context)                                      .bottomAppBarColor,                                ),                              ],                            ),                          ),                          Visibility(                            visible: true,                            child: Padding(                                padding:                                    const EdgeInsets.only(top: 16),                                child: Align(                                    alignment: Alignment.topLeft,                                    child: SizedBox(                                      width: 107,                                      height: 30,                                      child: ClipRRect(                                        borderRadius:                                            const BorderRadius.only(                                          bottomRight:                                              Radius.circular(10),                                          topRight:                                              Radius.circular(10),                                        ),                                        child: ColoredBox(                                            color: saleType(                                                TypeSale.discount),                                            child: Center(                                              child: Text(                                                xitProdaj,                                                style:                                                    Theme.of(context)                                                        .textTheme                                                        .headline5,                                              ),                                            )),                                      ),                                    ))),                          ),                          Visibility(                            visible: true,                            child: Padding(                                padding:                                    const EdgeInsets.only(top: 16),                                child: Align(                                    alignment: Alignment.topLeft,                                    child: SizedBox(                                      width: 107,                                      height: 30,                                      child: ClipRRect(                                        borderRadius:                                            const BorderRadius.only(                                          bottomRight:                                              Radius.circular(10),                                          topRight:                                              Radius.circular(10),                                        ),                                        child: ColoredBox(                                            color: saleType(                                                TypeSale.discount),                                            child: Center(                                              child: Text(                                                xitProdaj,                                                style:                                                    Theme.of(context)                                                        .textTheme                                                        .headline5,                                              ),                                            )),                                      ),                                    ))),                          ),                          Visibility(                            visible: true,                            child: Padding(                                padding:                                    const EdgeInsets.only(top: 16),                                child: Align(                                    alignment: Alignment.topLeft,                                    child: SizedBox(                                      width: 107,                                      height: 30,                                      child: ClipRRect(                                        borderRadius:                                            const BorderRadius.only(                                          bottomRight:                                              Radius.circular(10),                                          topRight:                                              Radius.circular(10),                                        ),                                        child: ColoredBox(                                            color: saleType(                                                TypeSale.popular),                                            child: Center(                                              child: Text(                                                xitProdaj,                                                style:                                                    Theme.of(context)                                                        .textTheme                                                        .headline5,                                              ),                                            )),                                      ),                                    ))),                          ),                        ],                      ),                    );                  },                  childCount: state.catalog.length,                ),              )            : SliverGrid(                key: const PageStorageKey<String>('category'),                gridDelegate: orient == 'portrait'                    ? const SliverGridDelegateWithFixedCrossAxisCount(                        crossAxisCount: 2,                        mainAxisSpacing: 25,                        crossAxisSpacing: 10,                        childAspectRatio: 0.5,                      )                    : const SliverGridDelegateWithFixedCrossAxisCount(                        crossAxisCount: 4,                        mainAxisSpacing: 29,                        crossAxisSpacing: 16,                        childAspectRatio: 0.6,                      ),                delegate: SliverChildBuilderDelegate(                  (BuildContext context, int index) {                    String localLang = context.locale.languageCode;                    return const LoadingPage();                  },                  childCount: 10,                ),              ),      );    });  }}class CompanyInfo extends StatelessWidget {  final Contacts contacts;  const CompanyInfo({    Key? key,    required this.contacts,  }) : super(key: key);  @override  Widget build(BuildContext context) {    List<Social> social = context.read<MainBloc>().repository.appData.social;    String lang = context.locale.languageCode;    return SizedBox(      height: 480,      width: double.infinity,      child: ColoredBox(        color: Theme.of(context).canvasColor,        child: Padding(          padding: const EdgeInsets.symmetric(horizontal: 22),          child: Column(            crossAxisAlignment: CrossAxisAlignment.start,            children: [              const SizedBox(                height: 44,              ),              Text(                companyname.tr().toString(),                style: Theme.of(context).textTheme.headline1,              ),              const SizedBox(                height: 35,              ),              // Text(              //   aboutIntex1.tr(),              //   style: Theme.of(context)              //       .textTheme              //       .headline2              //       ?.copyWith(fontWeight: FontWeight.w400),              // ),              Row(                children: [                  LinkButton(                    onPressed: () =>                        URL.launch(socialGet(social, 'Facebook')),                    title: 'f',                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                    onPressed: () =>                        URL.launch(socialGet(social, 'Linkedin')),                    title: 'in',                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                    onPressed: () =>                        URL.launch(socialGet(social, 'Instagram')),                    title: '',                    icon: SvgPicture.asset(instagramSVG),                  ),                  const SizedBox(                    width: 27,                  ),                  LinkButton(                      onPressed: () => URL.launch(socialGet(                          social,                          'Twitter'                          '')),                      title: '',                      icon: SvgPicture.asset(twitterSVG)),                ],              ),              const SizedBox(                height: 34,              ),              ///#title Address              // const _cutomTextWidget(title: link),              // const SizedBox(              //   height: 16,              // ),              //              // SpanButton(              //     title: productAbout,              //     onPressed: () {              //       ctr.animateTo(0.0,              //           duration: const Duration(milliseconds: 500),              //           curve: Curves.easeIn);              //     }),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(              //     title: whyWe,              //     onPressed: () {              //       ctr.animateTo(2803,              //           duration: const Duration(milliseconds: 500),              //           curve: Curves.easeIn);              //     }),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(              //     title: cont,              //     onPressed: () {              //       ctr.animateTo(ctr.position.maxScrollExtent,              //           duration: const Duration(milliseconds: 500),              //           curve: Curves.easeIn);              //     }),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(title: category, onPressed: () {}),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(              //     title: popular,              //     onPressed: () {              //       ctr.animateTo(551,              //           duration: const Duration(milliseconds: 500),              //           curve: Curves.easeIn);              //     }),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(              //     title: news,              //     onPressed: () {              //       ctr.animateTo(1515,              //           duration: const Duration(milliseconds: 500),              //           curve: Curves.easeIn);              //     }),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(              //     title: discount,              //     onPressed: () {              //       ctr.animateTo(3749,              //           duration: const Duration(milliseconds: 500),              //           curve: Curves.easeIn);              //     }),              // const SizedBox(              //   height: 8,              // ),              // const _cutomTextWidget(title: callCentre),              // const SizedBox(              //   height: 16,              // ),              // SpanButton(title: deliveryAndPayment, onPressed: () {}),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(title: frequentlyAsked, onPressed: () {}),              // const SizedBox(              //   height: 8,              // ),              // SpanButton(title: confidential, onPressed: () {}),              // const SizedBox(              //   height: 16,              // ),              const _CustomTextWidget(title: address),              const SizedBox(                height: 24,              ),              ///#address              Row(                children: [                  Icon(                    Icons.location_on_outlined,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  ///TODO: Lang En Setting                  SizedBox(                    width: MediaQuery.of(context).size.width * .7,                    child: Text(                      lang == Lang.ru.name                          ? contacts.address_ru                          : lang == Lang.en.name                              ? contacts.address_en                              : contacts.address_uz,                      overflow: TextOverflow.ellipsis,                      maxLines: 2,                    ),                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#number              Row(                children: [                  Icon(                    CupertinoIcons.phone,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  Text(                    numberParser("998${contacts.phone}"),                    overflow: TextOverflow.ellipsis,                    maxLines: 4,                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#gmaiadress              Row(                children: [                  Icon(                    Icons.mail_outline,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  Text(                    contacts.email,                    overflow: TextOverflow.ellipsis,                    maxLines: 4,                  )                ],              ),              const SizedBox(                height: 8,              ),              ///#working time              Row(                children: [                  Icon(                    CupertinoIcons.clock,                    color: Theme.of(context).primaryColor,                  ),                  const SizedBox(                    width: 8,                  ),                  InkWell(                    onTap: () {},                    child: Text(                      lang == Lang.ru.name                          ? contacts.work_ru                          : lang == Lang.en.name                              ? contacts.work_en                              : contacts.work_ru,                      overflow: TextOverflow.ellipsis,                      maxLines: 4,                    ),                  ),                ],              ),              const SizedBox(                height: 16,              ),              Divider(                color: Theme.of(context).primaryColor,              ),              const SizedBox(                height: 16,              ),              Text(                endPage.tr().toString(),                style: Theme.of(context).textTheme.headline3,              )            ],          ),        ),      ),    );  }}class _CustomTextWidget extends StatelessWidget {  final String title;  const _CustomTextWidget({    Key? key,    required this.title,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Text(      title.tr().toString(),      style: Theme.of(context)          .textTheme          .headline2          ?.copyWith(fontSize: 18),    );  }}
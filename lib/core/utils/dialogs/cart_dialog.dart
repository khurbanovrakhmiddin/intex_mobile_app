import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:intex_mobile_app/core/models/Catalog_model.dart';import 'package:intex_mobile_app/core/models/Order.dart';import 'package:intex_mobile_app/core/repository/cart_repository.dart';import 'package:intex_mobile_app/core/service/mapper.dart';import 'package:intex_mobile_app/core/utils/cart_tile.dart';import 'package:intex_mobile_app/core/utils/dialogs/success_dialog.dart';import 'package:intex_mobile_app/core/utils/sackbar_custom.dart';import 'package:intex_mobile_app/features/screens/cart_page/cart_bloc/cart_bloc.dart';import '../../constants/text.dart';import '../buttons/button.dart';///TODO:SUCCESS CompletedFuture cartDialog({Key? key,required final context,required Catalogcatalog}) {  return showDialog(      context: context,      builder: (BuildContext context) {        String localLang = context.locale.languageCode;        // if(MediaQuery.of(context).orientation.name != 'portrait'){        //   Navigator.of(context).pop();        // }       return  BlocProvider(            create: (context) => CartBloc(               CartRepository(catalog),            ),         child: _PhoneCartPage(catalog:catalog),) ;      });}class _PhoneCartPage extends StatelessWidget {  final Catalog catalog;  const _PhoneCartPage({    Key? key, required this.catalog,  }) : super(key: key);  @override  Widget build(BuildContext context) {print(MediaQuery.of(context).orientation.name);return BlocListener<CartBloc,CartState>(listener: (context,state){if(state is CartSuccessState){  customSnackbar(            context: context,            title: successRequested.tr().toString(),            color: Colors.green);  Navigator.of(context).pop();  successDialog(context: context);  //   // return  // } catch (e) {  //   // isPressed = false;  //   // setState(() {});  //   // return  //   // );  //  }  // }}else if(state is CartErrorState){  customSnackbar(         context: context,         title: state.message.toString());  // Future.delayed(const Duration(milliseconds: 400)).then((value){  //     Navigator.of(context).pop();  //     successDialog(context: context);  // });}},child: Padding(  padding: EdgeInsets.symmetric(    vertical: MediaQuery.of(context)        .viewPadding        .top,  ),  child: Dialog(    backgroundColor: Colors.transparent,    insetPadding:    const EdgeInsets.all(10),    child: Container(        margin: MediaQuery.of(context).orientation.name == 'portr'            'ait'? EdgeInsets.symmetric(vertical:        MediaQuery.of(context).size.width * .2):EdgeInsets            .symmetric(horizontal:        MediaQuery.of(context).size.width * .2),        width: double.infinity,        height: double.infinity,        decoration: BoxDecoration(            borderRadius:            BorderRadius.circular(15),            color: Theme.of(context)                .dividerColor),        padding:        const EdgeInsets.symmetric(            horizontal: 15,            vertical: 16),        child: Stack(          children: [            SingleChildScrollView(                child: Column(                  mainAxisSize: MainAxisSize.min,                  crossAxisAlignment: CrossAxisAlignment.start,                  children: [                    Center(                      child: Text(yourCart.tr(),style: Theme.of                        (context).textTheme                          .headline2?.copyWith(fontSize: 25),),                    ),                    const Divider(color: Colors.grey,),                    const SizedBox(height: 10,),                    CartTile(catalog: catalog,),                    const Divider(color: Colors.grey,),                    const SizedBox(height: 10,),                    Row(                      children: [                        Text('Общая сумма:',style:  Theme.of                          (context).textTheme.headline3,),                        const SizedBox(width: 16,),                        BlocBuilder<CartBloc,CartState>(builder: (context,                            state){                          if (state is CartUpdateState) {                            return Text(priceParser("${context                                .read<CartBloc>().repository.catalog.discountPrice *                                state.bascet.count}", context                                .locale                                .languageCode),                              style:                              Theme                                  .of                                (context)                                  .textTheme                                  .headline3                                  ?.copyWith                                (fontWeight: FontWeight.w700),);                          }                          return Text(priceParser(catalog.discountPrice, context.locale                              .languageCode),                            style:                            Theme                                .of                              (context)                                .textTheme                                .headline3                                ?.copyWith                              (fontWeight: FontWeight.w700),);                        }),                      ],),                    const SizedBox(height: 10,),                    const Divider(color: Colors.grey,),                    const SizedBox(height: 24,),                    Text(                      name.tr().toString(),                      style: Theme.of(context)                          .textTheme                          .headline6,                    ),                    const SizedBox(                      height: 12,                    ),                    _CustomTextFields(),                  ],                )),            Align(              alignment:              Alignment.topRight,              child: GestureDetector(                child: ClipRRect(                  borderRadius:                  BorderRadius                      .circular(7),                  child: ColoredBox(                    color: Theme.of(                        context)                        .bottomAppBarColor,                    child: const Icon(                      Icons.close,                      color: Colors.white,                    ),                  ),                ),                onTap: () =>                    Navigator.of(context)                        .pop(),              ),            ),          ],        )),  ),),);  }}class _CustomTextFields extends StatefulWidget {  const _CustomTextFields({Key? key}) : super(key: key);  @override  State<_CustomTextFields> createState() => _CustomTextFieldsState();}class _CustomTextFieldsState extends State<_CustomTextFields> {late TextEditingController _nameController;late TextEditingController _phoneController;late TextEditingController _addressController;final _formKey =  GlobalKey<FormState>();bool isPressed = false; @override  void initState() {    // TODO: implement initState    super.initState();    _nameController = TextEditingController();    _phoneController = TextEditingController();    _addressController = TextEditingController();  }  @override  void dispose() {    _nameController.dispose();    _phoneController.dispose();    _addressController.dispose();    super.dispose();  }void validAndSend(BuildContext context){  final form = _formKey.currentState;  if(form!.validate())  {    String phone = _phoneController.text.trim();    String name = _nameController.text.trim();    String address = _addressController.text.trim();    context.read<CartBloc>().add(CartSendtEvent(name: name, addres: address,phone: phone));  }}  @override  Widget build(BuildContext context) {    return Form(      key: _formKey,      child: Column(        crossAxisAlignment: CrossAxisAlignment.start,        children: [          TextFormField(            controller: _nameController,          validator: (value)=> value!.length < 3 ? nameError.tr().toString():null,            inputFormatters: [              FilteringTextInputFormatter.allow(                  RegExp(r'[a-z A-Z]')),            ],      decoration: InputDecoration(              hintText: name.tr(),              hintStyle: const TextStyle(                  color: Colors.grey              ),              border: OutlineInputBorder(                  borderRadius:                  BorderRadius.circular(                      8),                  borderSide: BorderSide(                      color: Colors                          .grey.shade300),                  gapPadding: 1),              focusedBorder:              OutlineInputBorder(                  borderSide: BorderSide(                      color: Colors                          .grey.shade300),                  borderRadius:                  BorderRadius                      .circular(8),                  gapPadding: 1),            ),          ),          const SizedBox(            height: 12,          ),          Text(            phoneNumber.tr(),            style: Theme.of(context)                .textTheme                .headline6,          ),          const SizedBox(            height: 12,          ),          TextFormField(            controller: _phoneController,            validator: (value)=> value!.length != 9 ?            numberError.tr().toString():null,            onChanged: (txt) {              ///TODO number ADd            },            maxLength: 9,            inputFormatters: [              FilteringTextInputFormatter.digitsOnly,            ],            keyboardType: TextInputType.phone,            decoration: InputDecoration(              counterStyle: const TextStyle(                height: double.minPositive,              ),              counterText: "",              hintStyle: Theme.of(context).textTheme                  .headline3?.copyWith(color: Colors.grey),              hintText: "(90) 123 45 67",              prefixIcon:SizedBox(                width: 100,                child: Row(children: [const SizedBox(width: 14,),                  Image.asset('assets/icons/flagUz.png',width: 28,                    height: 20,),SizedBox(width: 4,),Text                    ('+998',style:                  Theme.of                    (context).textTheme.headline3,),                ],),              ),              border: OutlineInputBorder(                  borderRadius:                  BorderRadius.circular(                      8),                  borderSide: BorderSide(                      color: Colors                          .grey.shade300),                  gapPadding: 1),              focusedBorder:              OutlineInputBorder(                  borderSide: BorderSide(                      color: Colors                          .grey.shade300),                  borderRadius:                  BorderRadius                      .circular(8),                  gapPadding: 1),            ),          ),          const SizedBox(            height: 16,          ),          Text(            address.tr(),            style: Theme.of(context)                .textTheme                .headline6,          ),          const SizedBox(            height: 12,          ),          TextFormField(            controller: _addressController,            validator: (value)=> value!.length < 3 ?            addressError.tr().toString():null,            decoration: InputDecoration(              hintText: address.tr(),              hintStyle: const TextStyle(                  color: Colors.grey              ),              suffixIcon: Icon(CupertinoIcons                  .location_solid,color: Theme.of                (context).primaryColor,size: 28,),              border: OutlineInputBorder(                  borderRadius:                  BorderRadius.circular(                      8),                  borderSide: BorderSide(                      color: Colors                          .grey.shade300),                  gapPadding: 1),              focusedBorder:              OutlineInputBorder(                  borderSide: BorderSide(                      color: Colors                          .grey.shade300),                  borderRadius:                  BorderRadius                      .circular(8),                  gapPadding: 1),            ),          ),          const SizedBox(            height: 16,          ),      CustomButton(    title: cart,    onPressed: ()=>validAndSend(context),      color: Theme.of(context)        .bottomAppBarColor,    ),         // BlocBuilder(builder: (context,state){         //         //   if(state is CartLoading){         //         //     return const Center(child: CircularProgressIndicator(),);         //   }         //   return  CustomButton(         //     title: cart,         //     onPressed: ()=>validAndSend(context),         //     color: Theme.of(context)         //         .bottomAppBarColor,         //   );         // }),        ],      ),    );  }}
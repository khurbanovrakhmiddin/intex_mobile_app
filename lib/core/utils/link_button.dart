import 'package:flutter/material.dart';class LinkButton extends StatelessWidget {  final onPressed;  Widget? icon;  double radius;  final String title;  LinkButton({    Key? key,required this.onPressed,required this.title,this.icon,  this.radius = 10  }) : super(key: key);  @override  Widget build(BuildContext context) {    return SizedBox(height: 40,width: 40,child: ClipRRect      (borderRadius: BorderRadius.circular(radius),child: ColoredBox(      color:radius == 10? Theme.of(context).primaryColor: Colors          .grey.shade300,      child: Stack(        children: [          Center(child: icon??Text            (title,style: const TextStyle(color: Colors.white,fontSize:          27,fontWeight: FontWeight.bold),)),          ElevatedButton(              style: ButtonStyle(                  fixedSize:MaterialStateProperty.all<Size>(const Size(40,                      40),),                  minimumSize:MaterialStateProperty.all<Size>(const Size                    (40,40),),                  shadowColor:MaterialStateProperty.all(Colors.transparent),                  backgroundColor: MaterialStateProperty.all(Colors.transparent)              ),              onPressed: onPressed, child: const SizedBox.shrink())        ],      ),    ),),);  }}
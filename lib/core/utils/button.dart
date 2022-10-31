import 'package:flutter/material.dart';class CustomButton extends StatelessWidget {  final title;  final onPressed;  final Color? color;  const CustomButton({    Key? key,required this.title,required this.onPressed, this.color = Colors.white,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return ElevatedButton(        style: ButtonStyle(            elevation: MaterialStateProperty.all(4),            minimumSize: MaterialStateProperty.all(                 const Size(double.infinity, 48)),            maximumSize: MaterialStateProperty.all(                const Size(double.infinity, 48)),            backgroundColor: MaterialStateProperty.all(              color,            ),            shape: MaterialStateProperty.all<                RoundedRectangleBorder>(                RoundedRectangleBorder(                  borderRadius: BorderRadius.circular(10),                ))),        onPressed: onPressed,        child: Text(          title,          style: Theme.of(context)              .textTheme              .headline4              ?.copyWith(              color: Theme.of(context)                  .dividerColor,              fontSize: 17),        ));  }}
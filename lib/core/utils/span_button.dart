import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';class SpanButton extends StatelessWidget {  final String title;  final  onPressed;  const SpanButton({    Key? key, required this.title, this.onPressed,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return InkWell(      onTap: onPressed,      child: Text(        title.tr(),        style: Theme.of(context).textTheme.headline3,      ),    );  }}
import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';class SpanButton extends StatefulWidget {  final String title;  final onPressed;  TextStyle? style;  SpanButton({    Key? key,    required this.title,    this.onPressed,    this.style,  }) : super(key: key);  @override  State<SpanButton> createState() => _SpanButtonState();}class _SpanButtonState extends State<SpanButton> {  bool onPressed = false;@override  void dispose() {    super.dispose();  }  @override  Widget build(BuildContext context) {  var color = Theme.of(context).primaryColor;    return InkWell(      splashColor: Colors.transparent,      focusColor: Colors.transparent,      hoverColor: Colors.transparent,      highlightColor: Colors.transparent,      onTap: widget.onPressed,      onHighlightChanged: (res) {        setState(() {          onPressed = res;        });      },      onHover: (res) {        setState(() {          onPressed = res;        });      },      child: Text(        widget.title.tr().toString(),        style: widget.style?.copyWith(color:onPressed? color:widget.style!.color)      ),    );  }}
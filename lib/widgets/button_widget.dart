import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final Color backgroundColor;
  final String text;
  final Color textColor;
  const ButtonWidget({Key? key, required this.text, required this.backgroundColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40)
      ),
      child: Text(text, style: TextStyle(
        fontSize: 20,
        color: textColor
      )),
    );
  }
}
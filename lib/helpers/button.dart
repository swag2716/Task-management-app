import 'package:flutter/material.dart';

ButtonStyle button(Color backgroundColor, Color textColor) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: textColor,
    backgroundColor: backgroundColor,
    minimumSize: const Size(350, 60),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );
  return raisedButtonStyle;
}

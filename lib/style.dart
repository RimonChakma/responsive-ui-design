import 'package:flutter/material.dart';

TextField inputField ({required String label, required Icon prefixIcon, Icon? suffixIcon}) {
  return TextField(decoration: InputDecoration(
    border: OutlineInputBorder(

    ),
    hintText: label,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon
  ),);
}

ButtonStyle buttonStyle (backgroundColor) {
  return ElevatedButton.styleFrom(
    backgroundColor: backgroundColor
  );
}
import 'package:flutter/material.dart';

//Search input Border...
OutlineInputBorder customSearchInputBorderStyle() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
  );
}

// Custom Navigation BackGround Color...
Color customBackgroundColor() {
  return const Color.fromRGBO(245, 247, 249, 1);
}

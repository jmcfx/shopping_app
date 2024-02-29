import 'package:flutter/material.dart';
class CustomHeaderTextStyle extends StatelessWidget {
  const CustomHeaderTextStyle({
    super.key, required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style:const  TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

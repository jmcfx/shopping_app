import 'package:flutter/material.dart';
import 'package:shopping_app/view/shared/style.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(
          Icons.search,
        ),
        border: customSearchInputBorderStyle(),
        enabledBorder: customSearchInputBorderStyle(),
        focusedBorder: customSearchInputBorderStyle(),
      ),
    );
  }
}

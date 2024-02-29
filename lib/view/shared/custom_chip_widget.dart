import 'package:flutter/material.dart';
import 'package:shopping_app/view/shared/style.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    required this.selectedFilters,
    required this.filter,
  });

  final String selectedFilters;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: selectedFilters == filter
          ? Theme.of(context).primaryColor
          : customBackgroundColor(),
      side: BorderSide(
        color: customBackgroundColor(),
      ),
      label: Text(filter),
      labelStyle: const TextStyle(
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearchQuery;

  const InputSearch(
      {super.key, required this.controller, required this.onSearchQuery});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: AppStyle.primaryColor),
      cursorColor: AppStyle.primaryColor,
      decoration: InputDecoration(
        hintText: 'Buscar Establecimientos...',
        hintStyle: const TextStyle(color: AppStyle.primaryColor),
        prefixIcon: AppStyle.inputIcon,
        enabledBorder: AppStyle.inpuBorder,
        focusedBorder: AppStyle.inpuBorder,
      ),
      onChanged: onSearchQuery,
    );
  }
}

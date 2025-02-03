import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class InputSearch extends StatefulWidget {
  final Function(String) callback;

  const InputSearch({super.key, required this.callback});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;



  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(color: AppStyle.primaryColor),
      cursorColor: AppStyle.primaryColor,
      decoration: InputDecoration(
        hintText: 'Buscar Establecimientos...',
        hintStyle: const TextStyle(color: AppStyle.primaryColor),
        prefixIcon: AppStyle.inputIcon,
        enabledBorder: AppStyle.inpuBorder,
        focusedBorder: AppStyle.inpuBorder,
      ),
      onChanged: (value) {
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () => widget.callback(value));
      }
    );
  }
}

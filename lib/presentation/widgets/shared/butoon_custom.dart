import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const ButtonCustom({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback, 
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppStyle.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text,style: const TextStyle(fontSize: 18, color: Colors.black))
    );
  }
}
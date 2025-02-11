import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class TitleSelection extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const TitleSelection({super.key, required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: callback,
          child: const Text('Ver más', style: TextStyle(color: AppStyle.primaryColor, fontSize: 16, fontWeight: FontWeight.bold))
        )
      ],
    );
  }
}
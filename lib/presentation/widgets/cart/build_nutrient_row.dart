import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class BuildNutrientRow extends StatelessWidget {
  final String titleData;
  final String data;

  const BuildNutrientRow({super.key, required this.titleData, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(titleData, style: AppStyle.generalParagraphBold)),
        Text(data, style: AppStyle.generalParagraphPrimaryColor)
      ],
    );
  }
}
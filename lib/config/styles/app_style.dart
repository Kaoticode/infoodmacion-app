import 'package:flutter/material.dart';

class AppStyle {
  static const primaryColor = Color.fromARGB(255, 225, 255, 0);

  static const lightColor = Color.fromARGB(255, 225, 226, 215);

  static const backgroundColor = Color.fromARGB(255, 25, 25, 25);

  static const secondAppBarColor = Color.fromRGBO(103,114,12, 1);

  static OutlineInputBorder inpuBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppStyle.primaryColor, width: 2), 
    borderRadius: BorderRadius.circular(15)
  );

  static const inputIcon = Icon(Icons.search_outlined, color: AppStyle.primaryColor);

  static const containerTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white);

  static final containerSubtitleTextStyle = TextStyle(color: Colors.grey[300]);

  static const secondContainerTitleTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  static const modalBottomSheetTitle = TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white);

  static const modalBottomSheetSubTitle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);

  static const modalBottomSheetParagraph = TextStyle(fontSize: 18, color: Colors.white);
}
import 'package:flutter/material.dart';

class CircularProgressIndicatorCustom extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CircularProgressIndicatorCustom({super.key, required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 3.0,
        ),
      )
    );
  }
}
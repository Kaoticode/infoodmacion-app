import 'package:flutter/material.dart';

class ElementContainerCustom extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final VoidCallback callback;

  const ElementContainerCustom({super.key, required this.height, required this.width, required this.child, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 12.5),
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
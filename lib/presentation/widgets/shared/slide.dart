import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final VoidCallback callback;
  final String name;
  final String image;
  final bool isLocalImage;

  const Slide({super.key, required this.callback, required this.name, required this.image, this.isLocalImage = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          width: screenWidth * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: isLocalImage ? AssetImage(image) : NetworkImage(image), 
              fit: BoxFit.cover
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],                   
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.black54),
              child: Text(name, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            ),
          ),
        ),
      )
    );
  }
}
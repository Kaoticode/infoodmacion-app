import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class ContainerCustom extends StatelessWidget {
  final VoidCallback callback;
  final bool isLocalImage;
  final String url;
  final String title;
  final String subtitle;
  final double height;
  final double width;

  const ContainerCustom({super.key, required this.callback, this.isLocalImage = false, required this.url, required this.title, required this.subtitle, required this.height, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: isLocalImage ? AssetImage(url) : NetworkImage(url),
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
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: const BoxDecoration(color: Colors.black54),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Text(title, style: AppStyle.containerTitleTextStyle),
              subtitle: Text(subtitle, style: AppStyle.containerSubtitleTextStyle)
            ),
          ),
        ),
      ),
    );
  }
}
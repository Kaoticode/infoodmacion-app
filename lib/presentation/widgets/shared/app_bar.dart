import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String nombre; 
  final String imagen; 

  const CustomAppbar({super.key, required this.nombre, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: imagen.isNotEmpty 
            ? Image.network(
                imagen,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppStyle.primaryColor,
                  );
                },
              )
            : Container(
                color: AppStyle.primaryColor, 
              ),
        ),
        AppBar(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  nombre,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          leadingWidth: 40,
          backgroundColor: Colors.black54,
          iconTheme: const IconThemeData(color: Colors.white, size: 20),
          elevation: 0,
          titleSpacing: 0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning, 
            size: 64.0,
            color: AppStyle.primaryColor, 
          ),
          SizedBox(height: 16.0), 
          Text(
            "No hay datos disponibles",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
          ),
          SizedBox(height: 8.0), 
          Text(
            "Intenta más tarde o verifica tu conexión.",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white, 
            ),
            textAlign: TextAlign.center, 
          ),
        ],
      ),
    );
  }
}
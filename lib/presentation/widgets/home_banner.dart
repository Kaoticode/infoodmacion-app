import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.15,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.contain,
        ),
        color: Color.fromARGB(190, 0, 0, 0), // Fondo oscuro semitransparente
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Bienvenido a Infoodmación',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: AppStyle.lightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Obtén información fresca sobre productos sin código de barras.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: AppStyle.lightColor,
            ),
          ),
        ],
      ),
    );
  }
}

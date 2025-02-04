import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  Future<void> _viewWeb() async {
    final Uri donateUrl = Uri.parse('https://www.kaoticode.com');
    if (!await launchUrl(donateUrl)) {
      throw Exception('Could not launch $donateUrl');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Tu apoyo es importante!', style: AppStyle.generalTitle),
            const SizedBox(height: 15),
            const Text(
              "Si disfrutas de esta aplicación y quieres apoyar su desarrollo, una excelente manera de hacerlo es compartiéndola con tus amigos. La aplicación siempre será gratuita, pero tu apoyo ayudará a que siga mejorando y evolucionando. ¡Gracias por ser parte de nuestra comunidad!", 
              style: TextStyle(fontSize: 16, color: AppStyle.lightColor), textAlign: TextAlign.center
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _viewWeb, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppStyle.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Ver mas proyectos de la compañía',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
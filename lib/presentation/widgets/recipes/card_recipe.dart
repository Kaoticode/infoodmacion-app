import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/domain/entities/recipe.dart';

class CardRecipe extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final List<Ingredient> ingredients;  
  final String description;

  const CardRecipe({super.key, required this.width, required this.height, required this.image, required this.title, required this.ingredients, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image)
        )
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(title, style: AppStyle.generalTitle)
              ),
              const SizedBox(height: 15),
              const Text('Ingredentes', style: AppStyle.generalSubtitle),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ingredients.map((ingredient) => 
                    Text('- ${ingredient.ingredient}', style: AppStyle.generalParagraph,)
                  ).toList()
              ),
              const SizedBox(height: 15),
              const Text('Descripción', style: AppStyle.generalSubtitle),
              const SizedBox(height: 10),
              Text(description, style: AppStyle.generalParagraph)
            ]
          )
        )
      )
    );
  }
}
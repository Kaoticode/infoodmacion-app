import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/food/food_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/food_place/food_place_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/recipe/recipe_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/trainer/trainer_bloc.dart';
import 'package:infoodmacion_app/presentation/widgets/home_banner.dart';
import 'package:infoodmacion_app/presentation/widgets/shared/circular_progress_indicator_custom.dart';
import 'package:infoodmacion_app/presentation/widgets/shared/slide.dart';
import 'package:infoodmacion_app/presentation/widgets/shared/title_selection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    try {
      context.read<FoodPlaceBlocBloc>().add(GetFoodPlaces());
      context.read<FoodBlocBloc>().add(GetFoods());
      context.read<TrainerBloc>().add(GetTrainers());
      context.read<RecipeBloc>().add(GetRecipes());
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeBanner(),
            SizedBox(height: screenHeight * 0.025),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TitleSelection(title: 'Establecimientos', callback: () {}),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: BlocBuilder<FoodPlaceBlocBloc, FoodPlaceBlocState>(
                      builder: (context, state) {
                        if(state is FoodPlaceLoading  || state is FoodPlaceInitial || state is FoodPlaceLoadedError) {
                          return CircularProgressIndicatorCustom(
                            width: screenWidth * 0.2, 
                            height: screenWidth * 0.2, 
                            color: AppStyle.primaryColor
                          );
                        }

                        final foodState = state is FoodPlaceLoaded ? state : const FoodPlaceLoaded(foods: []);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => Slide(name: foodState.foods[i].name, image: foodState.foods[i].image),
                          itemCount: foodState.foods.length,
                        );
                      },
                    )
                  ),
                  
                  const SizedBox(height: 25),

                  TitleSelection(title: 'Productos', callback: () {}),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: BlocBuilder<FoodBlocBloc, FoodBlocState>(
                      builder: (context, state) {
                        if(state is FoodBlocLoading  || state is FoodBlocInitial || state is FoodBlocLoadedError) {
                          return CircularProgressIndicatorCustom(
                            width: screenWidth * 0.2, 
                            height: screenWidth * 0.2, 
                            color: AppStyle.primaryColor
                          );
                        }

                        final foodState = state is FoodBlocLoaded ? state : const FoodBlocLoaded(foods: []);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => Slide(name: foodState.foods[i].name, image: foodState.foods[i].imageURL),
                          itemCount: foodState.foods.length,
                        );
                      },
                    )
                  ),

                  const SizedBox(height: 25),

                  TitleSelection(title: 'Entrenadores', callback: () {}),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: BlocBuilder<TrainerBloc, TrainerState>(
                      builder: (context, state) {
                        if(state is TrainerLoading  || state is TrainerInitial || state is TrainerLoadedError) {
                          return CircularProgressIndicatorCustom(
                            width: screenWidth * 0.2, 
                            height: screenWidth * 0.2, 
                            color: AppStyle.primaryColor
                          );
                        }

                        final trainerState = state is TrainerLoaded ? state : const TrainerLoaded(trainers: []);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => Slide(
                            name: trainerState.trainers[i].name, 
                            image: trainerState.trainers[i].image,
                            isLocalImage: trainerState.trainers[i].isLocalImage,
                          ),
                          itemCount: trainerState.trainers.length,
                        );
                      },
                    )
                  ),

                  const SizedBox(height: 25),
                  
                  TitleSelection(title: 'Recetas', callback: () {}),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: BlocBuilder<RecipeBloc, RecipeState>(
                      builder: (context, state) {
                        if(state is RecipeLoading  || state is RecipeInitial || state is RecipeLoadedError) {
                          return CircularProgressIndicatorCustom(
                            width: screenWidth * 0.2, 
                            height: screenWidth * 0.2, 
                            color: AppStyle.primaryColor
                          );
                        }

                        final recipeState = state is RecipeLoaded ? state : const RecipeLoaded(recipes: []);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => Slide(
                            name: recipeState.recipes[i].name, 
                            image: recipeState.recipes[i].image,
                          ),
                          itemCount: recipeState.recipes.length,
                        );
                      },
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
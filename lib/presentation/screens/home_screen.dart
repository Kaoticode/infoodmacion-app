import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/config/util/utils.dart';
import 'package:infoodmacion_app/presentation/blocs/food_local/food_local_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/foods/food_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/food_place/food_place_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/recipe/recipe_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/trainer/trainer_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  
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
    super.build(context);
    
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeBanner(),
          SizedBox(height: screenHeight * 0.025),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TitleSelection(title: 'Establecimientos', callback: () => Navigator.pushNamed(context, '/foods-establishments')),
                const SizedBox(height: 5),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: BlocBuilder<FoodPlaceBlocBloc, FoodPlaceBlocState>(
                    builder: (context, state) {
                      if(state is FoodPlaceLoading  || state is FoodPlaceInitial || state is FoodPlaceLoadedError) {
                        return CircularProgressIndicatorCustom(
                          width: screenWidth * 0.2, 
                          height: screenHeight * 0.2, 
                          color: AppStyle.primaryColor
                        );
                      }

                      final foodState = state is FoodPlaceLoaded ? state.foods : const FoodPlaceLoaded(foods: []).foods;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => Slide(
                          callback: () => Navigator.pushNamed(context, '/food-establishment', arguments: {
                            'id': foodState[i].id,
                            'name': foodState[i].name,
                            'image': foodState[i].image
                          }),
                          name: foodState[i].name, 
                          image: foodState[i].image
                        ),
                        itemCount: foodState.length,
                      );
                    },
                  )
                ),
                  
                const SizedBox(height: 25),

                TitleSelection(title: 'Productos', callback: () => Navigator.pushNamed(context, '/foods')),
                const SizedBox(height: 5),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: BlocBuilder<FoodBlocBloc, FoodBlocState>(
                    builder: (context, state) {
                      if(state is FoodBlocLoading  || state is FoodBlocInitial || state is FoodBlocLoadedError) {
                        return CircularProgressIndicatorCustom(
                          width: screenWidth * 0.2, 
                          height: screenHeight * 0.2, 
                          color: AppStyle.primaryColor
                        );
                      }

                      final foodState = state is FoodBlocLoaded ? state.foods : const FoodBlocLoaded(foods: []).foods;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => Slide(
                          isLocalImage: foodState[i].imageURL == "assets/logo.png",
                          callback: () {
                            context.read<FoodLocalBloc>().add(AddFoodToCart(food: foodState[i]));
                            CustomSnackbar.show(context, "El producto ${foodState[i].name} ha sido añadido correctamente.");
                          },
                          name: foodState[i].name, 
                          image: foodState[i].imageURL
                        ),
                        itemCount: foodState.length,
                      );
                    },
                  )
                ),

                const SizedBox(height: 25),

                TitleSelection(title: 'Entrenadores', callback: () => Navigator.pushNamed(context, '/trainers')),
                const SizedBox(height: 5),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: BlocBuilder<TrainerBloc, TrainerState>(
                    builder: (context, state) {
                      if(state is TrainerLoading  || state is TrainerInitial || state is TrainerLoadedError) {
                        return CircularProgressIndicatorCustom(
                          width: screenWidth * 0.2, 
                          height: screenHeight * 0.2, 
                          color: AppStyle.primaryColor
                        );
                      }

                      final trainerState = state is TrainerLoaded ? state.trainers : const TrainerLoaded(trainers: []).trainers;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => Slide(
                          callback: () {
                            try {
                              Utils.openInstagramProfile(trainerState[i].ig);
                            } catch(e) {
                              debugPrint(e.toString());
                            }
                          },
                          name: trainerState[i].name, 
                          image: trainerState[i].image,
                          isLocalImage: trainerState[i].isLocalImage,
                        ),
                        itemCount: trainerState.length,
                      );
                    },
                  )
                ),

                const SizedBox(height: 25),
                  
                TitleSelection(title: 'Recetas', callback: () => Navigator.pushNamed(context, '/recipes')),
                const SizedBox(height: 5),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: BlocBuilder<RecipeBloc, RecipeState>(
                    builder: (context, state) {
                      if(state is RecipeLoading  || state is RecipeInitial || state is RecipeLoadedError) {
                        return CircularProgressIndicatorCustom(
                          width: screenWidth * 0.2, 
                          height: screenHeight * 0.2, 
                          color: AppStyle.primaryColor
                        );
                      }

                      final recipeState = state is RecipeLoaded ? state.recipes : const RecipeLoaded(recipes: []).recipes;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => Slide(
                          callback: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => CardRecipe(
                              width: double.infinity, 
                              height: screenHeight * 0.5, 
                              image: recipeState[i].image, 
                              title: recipeState[i].name, 
                              ingredients: recipeState[i].ingredients, 
                              description: recipeState[i].description
                            ),
                          ),
                          name: recipeState[i].name, 
                          image: recipeState[i].image,
                        ),
                        itemCount: recipeState.length,
                      );
                    },
                  )
                ),

                const SizedBox(height: 15)
              ],
            ),
          )
        ],
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
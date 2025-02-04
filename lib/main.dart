import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/router/app_router.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/foods/food_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/food_place/food_place_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/foods_places_foods_search/bloc/foods_places_search_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/foods_places_search/foods_places_search_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/foods_search/foods_search_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/recipe/recipe_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/recipes_search_by_name_and_filter/bloc/recipes_search_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/trainer/trainer_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/trainers_search_by_name/trainers_search_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodPlaceBlocBloc()),
        BlocProvider(create: (context) => FoodBlocBloc()),
        BlocProvider(create: (context) => TrainerBloc()),
        BlocProvider(create: (context) => RecipeBloc()),
        BlocProvider(create: (context) => FoodsPlacesSearchBloc()),
        BlocProvider(create: (context) => FoodsPlacesSearchByNameBloc()),
        BlocProvider(create: (context) => FoodsSearchBloc()),
        BlocProvider(create: (context) => TrainersSearchBloc()),
        BlocProvider(create: (context) => RecipesSearchBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppStyle.backgroundColor
        ),
        routes: AppRouter.routes,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.initialRoute,
      ),
    );
  }
}
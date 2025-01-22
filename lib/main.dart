import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/router/app_router.dart';
import 'package:infoodmacion_app/presentation/blocs/food/food_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/food_place/food_place_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/blocs/trainer/trainer_bloc.dart';

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
        BlocProvider(create: (context) => TrainerBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: AppRouter.routes,
        initialRoute: AppRouter.initialRoute,
      ),
    );
  }
}
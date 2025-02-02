import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/food_place/food_place_bloc_bloc.dart';
import 'package:infoodmacion_app/presentation/widgets/widgets.dart';

class FoodsEstablishmentsScreen extends StatefulWidget {
  const FoodsEstablishmentsScreen({super.key});

  @override
  State<FoodsEstablishmentsScreen> createState() => _FoodsEstablishmentsScreenState();
}

class _FoodsEstablishmentsScreenState extends State<FoodsEstablishmentsScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    try {
      context.read<FoodPlaceBlocBloc>().add(GetFoodPlaces());
    } catch(e) {
      debugPrint(e.toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchQuery(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel(); // Cancela si hay una ejecución activa
        _debounce = Timer(const Duration(milliseconds: 500), () {
          print("Ejecutando búsqueda para: $query"); // Aquí llamas a la API o realizas la búsqueda
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondAppBarColor,
        title: const Text('Establecimientos', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            InputSearch(controller: _controller, onSearchQuery: _onSearchQuery),
            Expanded(
              child: BlocBuilder<FoodPlaceBlocBloc, FoodPlaceBlocState>(
                builder: (context, state) {
                  if(state is FoodPlaceLoading  || state is FoodPlaceInitial || state is FoodPlaceLoadedError) {
                    return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.2, 
                      height: screenHeight * 0.2, 
                      color: AppStyle.primaryColor
                    );
                  }

                  final foodState = state is FoodPlaceLoaded ? state : const FoodPlaceLoaded(foods: []);
                  return ListView.builder(
                    itemBuilder: (context, i) => ContainerCustom(
                      callback: () => Navigator.pushNamed(context, '/food-establishment', arguments: {
                        'id': foodState.foods[i].id,
                        'name': foodState.foods[i].name,
                        'image': foodState.foods[i].image
                      }),
                      url: foodState.foods[i].image, 
                      title: foodState.foods[i].name, 
                      subtitle: foodState.foods[i].description, 
                      height: screenHeight * 0.15
                    ),
                    itemCount: foodState.foods.length,
                  );
                },
              )
            )
          ],
        ),
      )
    );
  }
}
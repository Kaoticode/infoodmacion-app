import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/foods_places_foods_search/bloc/foods_places_search_bloc.dart';
import 'package:infoodmacion_app/presentation/widgets/shared/element_container_custom.dart';
import '../widgets/widgets.dart';

class FoodEstablishmentScreen extends StatefulWidget {
  final int id;
  final String url;
  final String name;

  const FoodEstablishmentScreen({super.key, required this.id, required this.url, required this.name});

  @override
  State<FoodEstablishmentScreen> createState() => _FoodEstablishmentScreenState();
}

class _FoodEstablishmentScreenState extends State<FoodEstablishmentScreen> {
  @override
  void initState() {
    try {
      context.read<FoodsPlacesSearchBloc>().add(GetFoodsByPlaceFilterByName(id: widget.id, name: ""));
    } catch (e) {
      debugPrint(e.toString());
    }
    super.initState();
  }

  void onSearchQuery(String value) => context.read<FoodsPlacesSearchBloc>().add(GetFoodsByPlaceFilterByName(id: widget.id , name: value));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppbar(nombre: widget.name, imagen: widget.url),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 15),
            InputSearch(callback: onSearchQuery, hintText: 'Buscar Productos...',),
            Expanded(
              child: BlocBuilder<FoodsPlacesSearchBloc, FoodsPlacesSearchState>(
                builder: (context, state) {
                  if(state is FoodsPlacesSearchInitial || state is FoodsPlacesSearchLoading || state is FoodsPlacesSearchError) {
                    return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.25, 
                      height: screenHeight * 0.25, 
                      color: AppStyle.primaryColor
                    );
                  }

                  final foodsPlacesSearch = state is FoodsPlacesSearchLoaded ? state.foods : const FoodsPlacesSearchLoaded(foods: []).foods;

                  if(foodsPlacesSearch.isEmpty) return const NoData();
                  
                  return ListView.builder(
                    itemCount: foodsPlacesSearch.length,
                    itemBuilder: (context, i) => ElementContainerCustom(
                      height: screenHeight * 0.075, 
                      width: double.infinity, 
                      child: Text(foodsPlacesSearch[i].name, style: AppStyle.secondContainerTitleTextStyle)
                    ),
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
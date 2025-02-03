import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/foods_places_search/foods_places_search_bloc.dart';
import 'package:infoodmacion_app/presentation/widgets/widgets.dart';

class FoodsEstablishmentsScreen extends StatefulWidget {
  const FoodsEstablishmentsScreen({super.key});

  @override
  State<FoodsEstablishmentsScreen> createState() => _FoodsEstablishmentsScreenState();
}

class _FoodsEstablishmentsScreenState extends State<FoodsEstablishmentsScreen> {
  @override
  void initState() {
    try {
      context.read<FoodsPlacesSearchByNameBloc>().add(const GetFoodsPlacesSearchByName(name: ''));
    } catch(e) {
      debugPrint(e.toString());
    }
    super.initState();
  }

  void _onSearchQuery(String query) => context.read<FoodsPlacesSearchByNameBloc>().add(GetFoodsPlacesSearchByName(name: query));

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
            InputSearch(callback: _onSearchQuery),
            Expanded(
              child: BlocBuilder<FoodsPlacesSearchByNameBloc, FoodsPlacesSearchState>(
                builder: (context, state) {
                  if(state is FoodsPlacesSearchLoading  || state is FoodsPlacesSearchInitial || state is FoodsPlacesSearchLoadedError) {
                    return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.2, 
                      height: screenHeight * 0.2, 
                      color: AppStyle.primaryColor
                    );
                  }

                  final foodsPlaces = state is FoodsPlacesSearchByNameLoaded ? state.foodsPlaces : const FoodsPlacesSearchByNameLoaded(foodsPlaces: []).foodsPlaces;
                  return ListView.builder(
                    itemBuilder: (context, i) => ContainerCustom(
                      callback: () => Navigator.pushNamed(context, '/food-establishment', arguments: {
                        'id': foodsPlaces[i].id,
                        'name': foodsPlaces[i].name,
                        'image': foodsPlaces[i].image
                      }),
                      url: foodsPlaces[i].image, 
                      title: foodsPlaces[i].name, 
                      subtitle: foodsPlaces[i].description, 
                      height: screenHeight * 0.15
                    ),
                    itemCount: foodsPlaces.length,
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
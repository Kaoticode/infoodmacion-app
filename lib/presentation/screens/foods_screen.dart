import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/foods_search/foods_search_bloc.dart';
import '../widgets/widgets.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        context.read<FoodsSearchBloc>().add(const GetFoodsSearchByName(name: ''));
      } catch(e) {
        debugPrint(e.toString());
      }
    });
  }

  void _onSearchQuery(String query) => context.read<FoodsSearchBloc>().add(GetFoodsSearchByName(name: query));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondAppBarColor,
        title: const Text('Productos Promocionados', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            InputSearch(callback: _onSearchQuery, hintText: 'Buscar Productos...',),
            Expanded(
              child: BlocBuilder<FoodsSearchBloc, FoodsSearchState>(
                builder: (context, state) {
                  if(state is FoodsSearchInitial || state is FoodsSearchLoading || state is FoodsSearchLoadedError) {
                    return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.2, 
                      height: screenHeight * 0.2, 
                      color: AppStyle.primaryColor
                    );
                  }

                  final foods = state is FoodsSearchLoaded ? state.foods : const FoodsSearchLoaded(foods: []).foods;
                  return ListView.builder(
                    itemCount: foods.length,
                    itemBuilder: (context, i) => ContainerCustom(
                      isLocalImage: foods[i].imageURL == "assets/logo.png",
                      callback: (){}, 
                      url: foods[i].imageURL, 
                      title: foods[i].name, 
                      subtitle: '', 
                      height: screenHeight * 0.1
                    )
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
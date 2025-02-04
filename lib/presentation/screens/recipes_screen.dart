import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/recipes_search_by_name_and_filter/bloc/recipes_search_bloc.dart';

import '../widgets/widgets.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final List<String> categorias = ["PRINCIPAL", "POSTRE", "BEBIDAS"];
  String _selectedCategory = "PRINCIPAL"; 
  String query = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        context.read<RecipesSearchBloc>().add(const GetRecipesSearchEvent(name: '', type: 'PRINCIPAL'));
      } catch(e) {
        debugPrint(e.toString());
      }
    });
  }

  void _onSearchQuery(String value) {
    query = value;
    context.read<RecipesSearchBloc>().add(GetRecipesSearchEvent(name: value, type: _selectedCategory));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondAppBarColor,
        title: const Text('Recetas', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            InputSearch(callback: _onSearchQuery, hintText: 'Buscar Recetas'),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categorias.map((categoria) {
                return ElevatedButton(
                  onPressed: () {
                    _selectedCategory = categoria;
                    context.read<RecipesSearchBloc>().add(GetRecipesSearchEvent(name: query, type: categoria));
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      _selectedCategory == categoria ? AppStyle.primaryColor : Colors.grey,
                    ),
                  ),
                  child: Text(categoria, style: const TextStyle(color: Colors.black),),
                );
              }).toList(),
            ),

            Expanded(
              child: BlocBuilder<RecipesSearchBloc, RecipesSearchState>(
                builder: (context, state) {
                  if(state is RecipesSearchInitial || state is RecipesSearchLoading || state is RecipesSearchLoadedError) {
                    return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.2, 
                      height: screenHeight * 0.2, 
                      color: AppStyle.primaryColor
                    );
                  }

                  final recipes = state is RecipesSearchLoaded ? state.recipes : const RecipesSearchLoaded(recipes: []).recipes;
                  return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, i) => ContainerCustom(
                      callback: (){}, 
                      url: recipes[i].image, 
                      title: recipes[i].name, 
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
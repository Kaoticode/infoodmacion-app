import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/food_local/food_local_bloc.dart';
import 'package:infoodmacion_app/presentation/widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    try {
      context.read<FoodLocalBloc>().add((GetFoodCart()));
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<FoodLocalBloc, FoodLocalState>(
      builder: (context, state) {
        if(state is FoodLocalInitial || state is FoodLocalLoading || state is FoodLocalLoadedError) {
          return CircularProgressIndicatorCustom(
            width: screenWidth * 0.2, 
            height: screenHeight * 0.2, 
            color: AppStyle.primaryColor
          );
        }

        final foodLocal = state is FoodLocalLoaded ? state.foodsLocal : const FoodLocalLoaded(foodsLocal: []).foodsLocal;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: foodLocal.length,
            itemBuilder: (context, i) => Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10), 
              width: double.infinity,
              height: screenHeight * 0.075,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      foodLocal[i].name,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.remove, color: AppStyle.primaryColor),
                    onPressed: () {
                      if(foodLocal[i].quantity == 1) {
                        CustomSnackbar.show(context, "El producto ${foodLocal[i].name} ha sido eliminado correctamente.");
                      }
                      context.read<FoodLocalBloc>().add(UpdateFoodCart(name: foodLocal[i].name, newAmount: -1));
                    },
                  ),

                  Text(
                    "${foodLocal[i].quantity}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),

                  IconButton(
                    icon: const Icon(Icons.add, color: AppStyle.primaryColor),
                    onPressed: () => context.read<FoodLocalBloc>().add(UpdateFoodCart(name: foodLocal[i].name, newAmount: 1))
                  ),
                ],
              ),
            )
          ),
        );
      },
    );
  }
  
  @override
  bool get wantKeepAlive => false;
}
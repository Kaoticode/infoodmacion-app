import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/nutriotion_stats/nutrition_stats_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../presentation/widgets/widgets.dart';

class Utils {
  static void openInstagramProfile(String username) async {
    final url = Uri.parse("https://www.instagram.com/$username");

    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static void showModalNutritionStats(BuildContext context) {
    context.read<NutritionStatsBloc>().add(GetMyNutritionStats());
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) =>
            BlocBuilder<NutritionStatsBloc, NutritionStatsState>(
              builder: (context, state) {
                final screenHeight = MediaQuery.of(context).size.height;
                final screenWidth = MediaQuery.of(context).size.width;

                if (state is NutritionStatsInitial ||
                    state is NutritionStatsLoadedError ||
                    state is NutritionStatsLoading) {
                  return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.2,
                      color: AppStyle.primaryColor);
                }

                if (state is NutritionStatsLoaded) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: AppStyle.backgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    width: double.infinity,
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text('Total de nutrientes', style: AppStyle.generalTitle)
                        ),
                        const SizedBox(height: 15),
                        BuildNutrientRow(titleData: 'Total Kcal: ', data: state.nutritionStats.kcal.toString()),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total KJ: ', data: state.nutritionStats.kJ.toString()),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total Grasa: ', data: '${state.nutritionStats.fat} g'),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total Grasa Saturada: ', data: '${state.nutritionStats.saturatedFat} g'),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total Hidratos de Carbono: ', data: '${state.nutritionStats.carbohydrates} g'),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total Azúcar: ', data: '${state.nutritionStats.sugar} g'),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total Fibra: ', data: '${state.nutritionStats.fiber} g'),
                        const SizedBox(height: 5),
                        BuildNutrientRow(titleData: 'Total Proteínas: ', data: '${state.nutritionStats.totalProteins} g')
                      ],
                    )),
                  );
                }
                return const SizedBox.shrink();
              },
            ));
  }
}
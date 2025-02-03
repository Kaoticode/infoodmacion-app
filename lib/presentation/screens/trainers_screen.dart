import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/trainers_search_by_name/trainers_search_bloc.dart';

import '../widgets/widgets.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({super.key});

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        context.read<TrainersSearchBloc>().add(const TrainersSearchByName(name: ''));
      } catch(e) {
        debugPrint(e.toString());
      }
    });
  }

  void _onSearchQuery(String query) => context.read<TrainersSearchBloc>().add(TrainersSearchByName(name: query));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondAppBarColor,
        title: const Text('Entrenadores', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            InputSearch(callback: _onSearchQuery),
            Expanded(
              child: BlocBuilder<TrainersSearchBloc, TrainersSearchState>(
                builder: (context, state) {
                  if(state is TrainersSearchInitial || state is TrainersSearchLoading || state is TrainersSearchLoadedError) {
                    return CircularProgressIndicatorCustom(
                      width: screenWidth * 0.2, 
                      height: screenHeight * 0.2, 
                      color: AppStyle.primaryColor
                    );
                  }

                  final trainers = state is TrainersSearchLoaded ? state.trainers : const TrainersSearchLoaded(trainers: []).trainers;
                  return ListView.builder(
                    itemCount: trainers.length,
                    itemBuilder: (context, i) => ContainerCustom(
                      callback: (){}, 
                      url: trainers[i].image, 
                      title: trainers[i].name, 
                      subtitle: '', 
                      height: screenHeight * 0.1,
                      isLocalImage: trainers[i].isLocalImage,
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
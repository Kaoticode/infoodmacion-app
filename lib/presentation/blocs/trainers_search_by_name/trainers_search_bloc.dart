import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/trainer.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'trainers_search_event.dart';
part 'trainers_search_state.dart';

class TrainersSearchBloc extends Bloc<TrainersSearchEvent, TrainersSearchState> {
  TrainersSearchBloc() : super(TrainersSearchInitial()) {
    on<TrainersSearchByName>(_onGetTrainersByName);
  }

  Future<void> _onGetTrainersByName(TrainersSearchByName event, Emitter<TrainersSearchState> emit) async {
    emit(TrainersSearchLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(TrainersSearchLoaded(trainers: await trainerRepositoryProvider.getTrainersByName(event.name)));
  }
}

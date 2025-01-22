import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/trainer.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'trainer_event.dart';
part 'trainer_state.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  TrainerBloc() : super(TrainerInitial()) {
    on<GetTrainers>(_onGetTrainers);
  }

  Future<void> _onGetTrainers(GetTrainers event, Emitter<TrainerState> emit) async {
    emit(TrainerLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(TrainerLoaded(trainers: await trainerRepositoryProvider.getTrainers()));
  }
}

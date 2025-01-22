part of 'trainer_bloc.dart';

sealed class TrainerEvent extends Equatable {
  const TrainerEvent();

  @override
  List<Object> get props => [];
}

final class GetTrainers extends TrainerEvent {}
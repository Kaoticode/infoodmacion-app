part of 'trainer_bloc.dart';

sealed class TrainerState extends Equatable {
  const TrainerState();
  
  @override
  List<Object> get props => [];
}

final class TrainerInitial extends TrainerState {}
final class TrainerLoading extends TrainerState {}

final class TrainerLoaded extends TrainerState {
  final List<Trainer> trainers;

  const TrainerLoaded({required this.trainers});

  @override
  List<Object> get props => [trainers];
}

final class TrainerLoadedError extends TrainerState {
  final int codeHttp;
  final String message;

  const TrainerLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}
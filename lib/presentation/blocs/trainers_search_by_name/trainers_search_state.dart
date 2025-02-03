part of 'trainers_search_bloc.dart';

sealed class TrainersSearchState extends Equatable {
  const TrainersSearchState();
  
  @override
  List<Object> get props => [];
}

final class TrainersSearchInitial extends TrainersSearchState {}
final class TrainersSearchLoading extends TrainersSearchState {}

final class TrainersSearchLoaded extends TrainersSearchState {
  final List<Trainer> trainers;

  const TrainersSearchLoaded({required this.trainers});

  @override
  List<Object> get props => [trainers];
}

final class TrainersSearchLoadedError extends TrainersSearchState {
  final int codeHttp;
  final String message;

  const TrainersSearchLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}
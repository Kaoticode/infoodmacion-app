part of 'trainers_search_bloc.dart';

sealed class TrainersSearchEvent extends Equatable {
  const TrainersSearchEvent();

  @override
  List<Object> get props => [];
}

final class TrainersSearchByName extends TrainersSearchEvent {
  final String name;

  const TrainersSearchByName({required this.name});
  
  @override
  List<Object> get props => [name];
}
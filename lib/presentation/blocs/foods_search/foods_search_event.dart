part of 'foods_search_bloc.dart';

sealed class FoodsSearchEvent extends Equatable {
  const FoodsSearchEvent();

  @override
  List<Object> get props => [];
}

final class GetFoodsSearchByName extends FoodsSearchEvent {
  final String name;

  const GetFoodsSearchByName({required this.name});

  @override
  List<Object> get props => [name];
}
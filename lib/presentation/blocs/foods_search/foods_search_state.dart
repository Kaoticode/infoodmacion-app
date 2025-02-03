part of 'foods_search_bloc.dart';

sealed class FoodsSearchState extends Equatable {
  const FoodsSearchState();
  
  @override
  List<Object> get props => [];
}

final class FoodsSearchInitial extends FoodsSearchState {}
final class FoodsSearchLoading extends FoodsSearchState {}

final class FoodsSearchLoaded extends FoodsSearchState {
  final List<Food> foods;

  const FoodsSearchLoaded({required this.foods});

  @override
  List<Object> get props => [foods];
}

final class FoodsSearchLoadedError extends FoodsSearchState {
  final int codeHttp;
  final String message;

  const FoodsSearchLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}
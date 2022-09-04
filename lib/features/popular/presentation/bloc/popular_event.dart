part of 'popular_bloc.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();
}
class GetPopularMoviesEvent extends PopularEvent{
  @override
  List<Object?> get props => [];
}

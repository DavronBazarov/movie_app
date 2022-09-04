part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  final List<Movie>? movies;
  final String? error;

  const PopularState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class PopularInitial extends PopularState {
  @override
  List<Object> get props => [];
}

class PopularLoading extends PopularState{
  @override
  List<Object?> get props => [];
}

class PopularDone extends PopularState{
  final List<Movie>? movies;
  final String imgUrl = "https://image.tmdb.org/t/p/w500/";
  const PopularDone(this.movies);
  @override
  List<Object?> get props => [movies];
}

class PopularMoviesError extends PopularState{
  final String error;
  const  PopularMoviesError(this.error) : super(error: error);
  @override
  List<Object?> get props => [error];
}

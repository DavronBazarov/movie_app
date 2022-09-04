import '../../data/models/movies_model.dart';

abstract class PopularMoviesUseCase{
  Future<List<Movie>> getPopular();
}
import 'package:test_app/data/models/movies_model.dart';

abstract class PopularMoviesUseCase{
  Future<List<Movie>> getPopular();
}
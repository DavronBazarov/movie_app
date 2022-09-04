import '../../models/movies_model.dart';

abstract class MoviesDataSource{
  Future<List<Movie>> getPopular();
}
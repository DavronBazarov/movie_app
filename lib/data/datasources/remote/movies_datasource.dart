import 'package:test_app/data/models/movies_model.dart';

abstract class MoviesDataSource{
  Future<List<Movie>> getPopular();
}
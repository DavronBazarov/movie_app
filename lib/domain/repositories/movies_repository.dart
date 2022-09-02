import 'package:test_app/data/models/movies_model.dart';

abstract class MoviesRepository{
  Future<List<Movie>> getPopular();
}
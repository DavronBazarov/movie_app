import 'package:test_app/data/models/movies_model.dart';
import 'package:test_app/domain/repositories/movies_repository.dart';
import 'package:test_app/domain/usecases/popular_movies_use_case.dart';

class PopularMoviesUseCaseImpl extends PopularMoviesUseCase{
  final MoviesRepository moviesrepository;
  PopularMoviesUseCaseImpl(this.moviesrepository);

  @override
  Future<List<Movie>> getPopular() {
return moviesrepository.getPopular();
  }

}
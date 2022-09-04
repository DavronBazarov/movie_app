
import 'package:test_app/features/popular/domain/usecases/popular_movies_use_case.dart';

import '../../data/models/movies_model.dart';
import '../repositories/movies_repository.dart';

class PopularMoviesUseCaseImpl extends PopularMoviesUseCase{
  final MoviesRepository moviesrepository;
  PopularMoviesUseCaseImpl(this.moviesrepository);

  @override
  Future<List<Movie>> getPopular() {
return moviesrepository.getPopular();
  }

}
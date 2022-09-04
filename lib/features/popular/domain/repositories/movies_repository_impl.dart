
import '../../data/datasources/remote/movies_datasource_impl.dart';
import '../../data/models/movies_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository{
  final MoviesDataSourceImpl moviesDataSourceImpl;
  MoviesRepositoryImpl(this.moviesDataSourceImpl);

  @override
  Future<List<Movie>> getPopular() {
    return moviesDataSourceImpl.getPopular();
  }

}
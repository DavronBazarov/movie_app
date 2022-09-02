import 'package:test_app/data/datasources/remote/movies_datasource_impl.dart';
import 'package:test_app/data/models/movies_model.dart';
import 'package:test_app/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository{
  final MoviesDataSourceImpl moviesDataSourceImpl;
  MoviesRepositoryImpl(this.moviesDataSourceImpl);

  @override
  Future<List<Movie>> getPopular() {
    return moviesDataSourceImpl.getPopular();
  }

}
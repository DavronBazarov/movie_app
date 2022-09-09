import '../../data/datasources/remote/movies_datasource_now_impl.dart';
import '../../data/models/now_playing.dart';
import 'movies_now_repositories.dart';

class MoviesRepositoryNowImpl extends MoviesRepositoryNow{
  final MoviesDataSourceNowImpl moviesDataSourceNowImpl;
  MoviesRepositoryNowImpl(this.moviesDataSourceNowImpl);

  @override
  Future<List<NowMovie>> getPopularNow() {
    return moviesDataSourceNowImpl.getPopularNow();
  }

}
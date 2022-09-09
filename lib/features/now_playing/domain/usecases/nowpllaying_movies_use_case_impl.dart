
import 'package:test_app/features/now_playing/domain/repositories/movies_now_repositories.dart';

import '../../data/models/now_playing.dart';
import 'nowplaying_movies_use_case.dart';

class NowPlayingMoviesUseCaseImpl extends NowPlayingMoviesUseCase{
  final MoviesRepositoryNow moviesRepositoryNow;
  NowPlayingMoviesUseCaseImpl(this.moviesRepositoryNow);

  @override
  Future<List<NowMovie>> getPopularNow() {
    return moviesRepositoryNow.getPopularNow();
  }

}
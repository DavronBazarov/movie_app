import '../../data/models/now_playing.dart';

abstract class NowPlayingMoviesUseCase{
  Future<List<NowMovie>> getPopularNow();
}
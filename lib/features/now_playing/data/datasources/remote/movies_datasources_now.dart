import '../../models/now_playing.dart';

abstract class MoviesDataSourceNow{
  Future<List<NowMovie>> getPopularNow();
}
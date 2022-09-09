import 'package:test_app/features/now_playing/data/models/now_playing.dart';

abstract class MoviesRepositoryNow{
  Future<List<NowMovie>> getPopularNow();
}
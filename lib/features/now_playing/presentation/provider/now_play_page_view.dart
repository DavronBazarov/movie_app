import 'package:flutter/cupertino.dart';
import 'package:test_app/features/now_playing/domain/usecases/nowplaying_movies_use_case.dart';

class NowPlayingPageView extends ChangeNotifier{
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  List nowMovies = [];

  NowPlayingPageView(this.nowPlayingMoviesUseCase);


  Future<void> getMoviesNow() async {
    var list = await nowPlayingMoviesUseCase.getPopularNow();
    nowMovies.clear();
    nowMovies.addAll(list);
    notifyListeners();
  }

}
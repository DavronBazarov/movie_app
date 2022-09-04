
import 'package:flutter/cupertino.dart';

import '../../domain/usecases/popular_movies_use_case.dart';

class HomePageView extends ChangeNotifier{
  final PopularMoviesUseCase popularMoviesUseCase;
  List popularMovies = [];

  HomePageView(this.popularMoviesUseCase);


  Future<void> getMovies() async {
    var list = await popularMoviesUseCase.getPopular();
    popularMovies.clear();
    popularMovies.addAll(list);
    notifyListeners();
  }

}
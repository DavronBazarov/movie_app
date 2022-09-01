import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:test_app/models/movies_model.dart';

class HomePageView extends ChangeNotifier{
  List popularMovies = [];


  Future<List> getMovies() async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_'
        'key=f75c6d6b22d698a448dd77d0181f4caa&language=en-US&page=1');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var moviesJson = jsonResponse['results'] as List;

      List<Movie> movies =
      moviesJson.map((element) => Movie.fromJson(element)).toList();
        popularMovies.clear();
        popularMovies.addAll(movies);
        notifyListeners();

      return popularMovies;
    } else {
      return List.empty();
    }
  }

}
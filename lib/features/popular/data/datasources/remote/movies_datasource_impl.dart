
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
 import '../../models/movies_model.dart';
import 'movies_datasource.dart';

class MoviesDataSourceImpl extends MoviesDataSource{
  @override
  Future<List<Movie>> getPopular() async {

    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_'
        'key=f75c6d6b22d698a448dd77d0181f4caa&language=en-US&page=1');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var moviesJson = jsonResponse['results'] as List;

      List<Movie> movies =
      moviesJson.map((element) => Movie.fromJson(element)).toList();
      return movies;
    } else {
      throw Exception("Nimadir xatolik");
    }
  }

}
import 'package:test_app/features/now_playing/data/models/now_playing.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'movies_datasources_now.dart';

class MoviesDataSourceNowImpl extends MoviesDataSourceNow {
  @override
  Future<List<NowMovie>> getPopularNow() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_'
            'key=f75c6d6b22d698a448dd77d0181f4caa&language=en-US&page=1');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var moviesJson = jsonResponse['results'] as List;

      List<NowMovie> moviesNow =
          moviesJson.map((element) => NowMovie.fromJson(element)).toList();
      return moviesNow;
    } else {
      throw Exception("Nimadir xatolik");
    }
  }
}

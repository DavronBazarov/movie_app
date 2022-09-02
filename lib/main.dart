import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/screens/home_screen.dart';
import 'package:test_app/presentation/provider/home_view.dart';

import 'data/datasources/remote/movies_datasource_impl.dart';
import 'domain/repositories/movies_repository_impl.dart';
import 'domain/usecases/popular_movies_use_case_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var popularMoviesUseCase =
    PopularMoviesUseCaseImpl(MoviesRepositoryImpl(MoviesDataSourceImpl()));

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageView(popularMoviesUseCase)),
      ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Color(0xffE5E5E5), appBarTheme: AppBarTheme(elevation: 0, color: Color(0xff2D5368) )),
          home: HomePage(),));
  }
}


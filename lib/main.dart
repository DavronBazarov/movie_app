import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/now_playing/domain/usecases/nowpllaying_movies_use_case_impl.dart';
import 'package:test_app/features/now_playing/presentation/bloc/now_bloc.dart';
import 'package:test_app/features/now_playing/presentation/provider/now_play_page_view.dart';
import 'package:test_app/features/now_playing/presentation/screens/test.dart';
import 'features/now_playing/data/datasources/remote/movies_datasource_now_impl.dart';
import 'features/now_playing/domain/repositories/now_impl.dart';
import 'features/popular/data/datasources/remote/movies_datasource_impl.dart';
import 'features/popular/domain/repositories/movies_repository_impl.dart';
import 'features/popular/domain/usecases/popular_movies_use_case_impl.dart';
import 'features/popular/presentation/bloc/popular_bloc.dart';
import 'features/popular/presentation/provider/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var popularMoviesUseCase =
        PopularMoviesUseCaseImpl(MoviesRepositoryImpl(MoviesDataSourceImpl()));
    var nowPlayingMoviesUseCase = NowPlayingMoviesUseCaseImpl(
        MoviesRepositoryNowImpl(MoviesDataSourceNowImpl()));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => NowPlayingPageView(nowPlayingMoviesUseCase)),
        ChangeNotifierProvider(
            create: (_) => HomePageView(popularMoviesUseCase)),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: const Color(0xffE5E5E5),
            appBarTheme:
                const AppBarTheme(elevation: 0, color: Color(0xff2D5368))),
        home: BlocProvider(
          create: (context) => NowBloc(nowPlayingMoviesUseCase),
          child: BlocProvider(
            create: (context) => PopularBloc(popularMoviesUseCase),
            child: MainHome(),
          ),
        ),
      ),
    );
  }
}

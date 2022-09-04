import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/features/popular/domain/usecases/popular_movies_use_case.dart';

import '../../data/models/movies_model.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final PopularMoviesUseCase useCase;

  PopularBloc(this.useCase) : super(PopularInitial()) {
    on<PopularEvent>((_mapPopularEventToState));

    }
    _mapPopularEventToState(PopularEvent event, Emitter<PopularState> emit) async{
      emit(PopularLoading());
      try{
        final movies = await useCase.getPopular();
        emit(PopularDone(movies));
      }
      catch(e){
        emit(PopularMoviesError(e.toString()));
      }
    }
  }


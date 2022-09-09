import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/now_playing.dart';
import '../../domain/usecases/nowplaying_movies_use_case.dart';

part 'now_event.dart';
part 'now_state.dart';

class NowBloc extends Bloc<NowEvent, NowState> {
 final NowPlayingMoviesUseCase useCaseNow;

  NowBloc(this.useCaseNow) : super(NowInitial()) {
    on<NowEvent>((_mapNowPlayingEventToState));
  }
 _mapNowPlayingEventToState(NowEvent event, Emitter<NowState> emit) async{
   emit(NowPlayingLoading());
   try{
     final movies = await useCaseNow.getPopularNow();
     emit(NowPlayingNowDone(movies));
   }
   catch(e){
     emit(NowPlayingError(e.toString()));
   }
 }
}

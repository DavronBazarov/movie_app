part of 'now_bloc.dart';

abstract class NowState extends Equatable {
  final List<NowMovie>? moviesNow;
  final String? error;
  const NowState({this.moviesNow, this.error});

  @override
  List<Object?> get props => [moviesNow, error];
}

class NowInitial extends NowState {
  @override
  List<Object> get props => [];
}
class NowPlayingLoading extends NowState{
  @override
  List<Object?> get props => [];
}
class NowPlayingNowDone extends NowState{
  final List<NowMovie>? moviesNow;
  final String imgUrl = "https://image.tmdb.org/t/p/w500/";
  const NowPlayingNowDone(this.moviesNow);
  @override
  List<Object?> get props => [moviesNow];
}
class NowPlayingError extends NowState{
  final String error;
  const  NowPlayingError(this.error) : super(error: error);
  @override
  List<Object?> get props => [error];
}

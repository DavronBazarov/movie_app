part of 'now_bloc.dart';

abstract class NowEvent extends Equatable {
  const NowEvent();
}
class GetNowPlayingEvent extends NowEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

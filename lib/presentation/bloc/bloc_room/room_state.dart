part of 'room_bloc.dart';

abstract class RoomState extends Equatable {
  const RoomState();
  
  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState{}

class RoomLoaded extends RoomState{
  final List<Room> roomsList;
  const RoomLoaded(this.roomsList);
}

class RoomError extends RoomState {
  final String? error;
  const RoomError(this.error);
}

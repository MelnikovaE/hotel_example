// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/api/api_repository.dart';
import '../../../domain/models/room.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetRoomsList>((event, emit) async {
      try {
        emit(RoomLoading());
        final List<Room> roomsList = await apiRepository.getRoomsList();
        emit(RoomLoaded(roomsList));
        if (roomsList.isEmpty) {
          emit(const RoomError("Данные не найдены. Повторите попытку позже."));
        }
      } on NetworkError {
        emit(const RoomError(
            "Проверьте подключение к интернету! Повторите попытку."));
      }
      catch (e) {
        emit(RoomError(e.toString()));
      }
    });
  }
}

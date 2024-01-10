// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/domain/models/hotel.dart';

import '../../../domain/api/api_repository.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetHotel>((event, emit) async {
      try {
        emit(HotelLoading());
        final Hotel hotel = await apiRepository.getHotel();
        emit(HotelLoaded(hotel));
      } on NetworkError {
        emit(const HotelError(
            "Проверьте подключение к интернету! Повторите попытку."));
      } catch (e) {
        emit(HotelError(e.toString()));
      }
    });
  }
}

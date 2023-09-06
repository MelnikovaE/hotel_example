// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/domen/models/booking.dart';

import '../../../domen/api/api_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetBooking>((event, emit) async {
       try {
        emit(BookingLoading());
        final Booking booking = await apiRepository.getBooking();
        emit(BookingLoaded(booking));
      } on NetworkError {
        emit(const BookingError(
            "Проверьте подключение к интернету! Повторите попытку."));
      }
      catch (e) {
        emit(BookingError(e.toString()));
      }
    });
  }
}

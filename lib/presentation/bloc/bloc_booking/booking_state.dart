part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();
  
  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState{}

class BookingLoaded extends BookingState{
  final Booking booking;
  const BookingLoaded(this.booking);
}

class BookingError extends BookingState {
  final String? error;
  const BookingError(this.error);
}

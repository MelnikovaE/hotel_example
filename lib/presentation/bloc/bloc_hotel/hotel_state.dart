part of 'hotel_bloc.dart';

abstract class HotelState extends Equatable {
  const HotelState();
  
  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState{}

class HotelLoaded extends HotelState{
  final Hotel hotel;
  const HotelLoaded(this.hotel);
}

class HotelError extends HotelState {
  final String? error;
  const HotelError(this.error);
}

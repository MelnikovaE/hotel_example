import 'package:hotel/domain/api/api_provader.dart';
import 'package:hotel/domain/models/booking.dart';

import '../models/hotel.dart';
import '../models/room.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Hotel> getHotel(){
    return _apiProvider.getHotel();
  }

  Future <List<Room>> getRoomsList(){
    return _apiProvider.getRoomsList();
  }

  Future <Booking> getBooking(){
    return _apiProvider.getBooking();
  }
}

class NetworkError extends Error{}
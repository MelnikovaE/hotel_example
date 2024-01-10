import 'package:dio/dio.dart';
import 'package:hotel/domain/models/booking.dart';
import 'package:hotel/domain/models/room.dart';

import '../models/hotel.dart';

class ApiProvider {
  Dio dio = Dio();

  final String _hotelURL =
      "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3";
  final String _roomURL =
      "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd";
  final String _bookingURL =
      "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8";

  Future<Hotel> getHotel() async {
    try {
      Response response = await dio.get(_hotelURL);
      Map<String,dynamic> value = response.data;
      return Hotel.fromJson(value);
    } catch (e) {
      //print(e);
      if (e.toString().contains("SocketException")) {
        throw Exception("Отсутсвует подключение к интернету");
      }
      throw Exception(e.toString());
    }
  }

  Future<List<Room>> getRoomsList() async {
    try {
      Response response = await dio.get(_roomURL);
      List<dynamic> value = response.data["rooms"];
      return value.map((e) => Room.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        throw Exception("Отсутсвует подключение к интернету");
      }
      throw Exception(e.toString());
    }
  }

  Future<Booking> getBooking() async {
    try {
      Response response = await dio.get(_bookingURL);
      Map<String, dynamic> value = response.data;
      return Booking.fromJson(value);
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        throw Exception("Отсутсвует подключение к интернету");
      }
      throw Exception(e.toString());
    }
  }
}

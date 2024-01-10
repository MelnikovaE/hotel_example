import 'package:flutter/material.dart';
import 'package:hotel/domain/models/booking.dart';
import '../../../widgets/table_row.dart';

class BookingDetails extends StatelessWidget {
  final Booking booking;
  const BookingDetails({
    super.key, required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(140),
        1: FlexColumnWidth(),
      },
      children: [
        myRow(title: "Вылет из", value: booking.departure),
        myRow(title: "Страна, город", value: booking.arrivalCountry),
        myRow(title: "Даты", value: "${booking.tourDateStart} – ${booking.tourDateStop}"),
        myRow(title: "Кол-во ночей", value: "${booking.numberOfNights} ночей"),
        myRow(title: "Отель", value: booking.hotelName),
        myRow(title: "Номер", value: booking.room),
        myRow(title: "Питание", value: booking.nutrition, padding: 0),
      ],
    );
  }
}

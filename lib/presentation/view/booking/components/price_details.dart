import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../domen/models/booking.dart';
import '../../../widgets/table_row.dart';

class PriceDetails extends StatelessWidget {
  final Booking booking;
  final int sum;
  const PriceDetails({
    super.key,
    required this.booking, required this.sum,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(140),
            1: FlexColumnWidth(),
          },
          children: [
            myRow(
                title: "Тур",
                value:
                    "${booking.tourPrice ~/ 1000} ${booking.tourPrice % 1000} ₽",
                align: TextAlign.right),
            myRow(
                title: "Топливный сбор",
                value:
                    "${booking.fuelCharge ~/ 1000} ${booking.fuelCharge % 1000} ₽",
                align: TextAlign.right),
            myRow(
                title: "Сервисный сбор",
                value:
                    "${booking.serviceCharge ~/ 1000} ${booking.serviceCharge % 1000} ₽",
                align: TextAlign.right),
            myRow(
                title: "К оплате",
                value:
                    "${sum ~/ 1000} ${sum  % 1000} ₽",
                padding: 0,
                color: blue,
                align: TextAlign.right),
          ],
        ),
      ],
    );
  }
}

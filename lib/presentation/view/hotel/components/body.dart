import 'package:flutter/material.dart';
import 'package:hotel/core/constants.dart';
import 'package:hotel/presentation/view/room/rooms_screen.dart';
import 'basic_data.dart';
import 'details.dart';

import '../../../../domain/models/hotel.dart';
import '../../../widgets/blue_button.dart';

Widget bodyLoaded(BuildContext context, Hotel hotel) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Основные данные об отеле
        BasicData(hotel: hotel),

        //Подробные данные об отеле
        Details(hotel: hotel),
        const SizedBox(height: defaultPaddin /2,),
        const Divider(thickness: 1,height: 1,color: grayDivider,),

        //Кнопка выбора
        Container(
          color: white,
          padding: const EdgeInsets.all(defaultPaddin / 2),
          child: MyButton(
            text: 'К выбору номера',
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomScreen(hotel: hotel,)),
              );
            },
          ),
        )
      ],
    ),
  );
}

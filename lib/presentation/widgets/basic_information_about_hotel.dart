import 'package:flutter/material.dart';

import '../../core/constants.dart';

class BasicInformation extends StatelessWidget {
  final String hotelName, adress, ratingName;
  final int horating;
  const BasicInformation({
    super.key,
    required this.hotelName,
    required this.adress,
    required this.ratingName,
    required this.horating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Рейтинг
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: defaultPaddin / 4, horizontal: defaultPaddin / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: lightYellow),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: yellow,
                    size: 17,
                  ),
                  Text(
                    " $horating $ratingName",
                    style: MyTextStyle.headLine2(color: yellow),
                  ),
                  const SizedBox(width: 5),
                ],
              )),
        ]),
        const SizedBox(
          height: defaultPaddin / 4,
        ),

        //Назваание отеля
        Text(
          hotelName,
          style: MyTextStyle.bigLine2(color: black),
        ),
        const SizedBox(
          height: defaultPaddin / 4,
        ),
      
        //Месторасположение
        GestureDetector(
            onTap: null,
            child: Text(
              adress,
              style: MyTextStyle.headLine3(color: blue),
            ))
      ],
    );
  }
}

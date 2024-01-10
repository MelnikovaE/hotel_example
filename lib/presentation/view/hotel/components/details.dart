import 'package:flutter/material.dart';
import 'package:hotel/core/constants.dart';
import 'package:hotel/domain/models/hotel.dart';
import 'package:hotel/presentation/widgets/custom_container.dart';

import '../../../widgets/menu_card.dart';
import '../../../widgets/peculiaritie_card.dart';

class Details extends StatefulWidget {
  final Hotel hotel;
  const Details({
    super.key,
    required this.hotel,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return defaultContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Об отеле',
          style: MyTextStyle.bigLine2(color: black),
        ),
        const SizedBox(
          height: defaultPaddin / 2,
        ),

        //Особенности отеля
        Wrap(
          spacing: defaultPaddin / 2,
          runSpacing: defaultPaddin / 4,
          children: widget.hotel.aboutTheHotel.peculiarities
              .map((e) => peculiaritieCard(text: e))
              .toList(),
        ),
         const SizedBox(
          height: defaultPaddin / 2,
        ),

        //Описание
        Text(
          widget.hotel.aboutTheHotel.description,
          style: MyTextStyle.headLine2S(color: black_2),
        ),
        const SizedBox(
          height: defaultPaddin,
        ),
        
        //Меню с подробной информацией
        Container(
          padding: const EdgeInsets.all(paddin15),
          decoration: BoxDecoration(
              color: lightGray, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              MenuCard(
                onTap: () {},
                icon: 'assets/images/emoji_happy.png',
                title: 'Удобства',
                divider: true,
              ),
              MenuCard(
                onTap: () {},
                icon: 'assets/images/tick_square.png',
                title: 'Что включено',
                divider: true,
              ),
              MenuCard(
                onTap: () {},
                icon: 'assets/images/close.png',
                title: 'Что не включено',
                divider: false,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

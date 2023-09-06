import 'package:flutter/material.dart';
import 'package:hotel/presentation/widgets/blue_button.dart';
import 'package:hotel/presentation/widgets/custom_container.dart';
import 'package:hotel/presentation/widgets/peculiaritie_card.dart';
import '../../../constants.dart';
import '../../../domen/models/room.dart';
import '../../widgets/carousel_image.dart';
import '../booking/booking_screen.dart';

class RoommCard extends StatefulWidget {
  final Room room;
  const RoommCard({super.key, required this.room});

  @override
  State<RoommCard> createState() => _RoommCardState();
}

class _RoommCardState extends State<RoommCard> {
  @override
  Widget build(BuildContext context) {
    return defaultContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Карусель из фотографий
        CarouselImage(images: widget.room.imageUrls),
        const SizedBox(height: defaultPaddin / 2),

        //Основные данные о номере
        Text(
          widget.room.name,
          style: MyTextStyle.bigLine2(color: black),
        ),
        const SizedBox(height: defaultPaddin / 2),

        Wrap(
          spacing: defaultPaddin / 2,
          runSpacing: defaultPaddin / 4,
          children: widget.room.peculiarities
              .map((e) => peculiaritieCard(text: e))
              .toList(),
        ),
        const SizedBox(height: defaultPaddin / 2),

        GestureDetector(
          onTap: () {},
          child: Container(
              width: 190,
              padding: const EdgeInsets.symmetric(
                  vertical: defaultPaddin / 4, horizontal: defaultPaddin / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: lightBlue),
              child: Row(
                children: [
                  Text(
                    "Подробнее о номере",
                    style: MyTextStyle.headLine2(color: blue),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: blue,
                    size: 15,
                  )
                ],
              )),
        ),
        const SizedBox(height: paddin15),

        //Стоимость
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text:
                  "${widget.room.price ~/ 1000} ${widget.room.price % 1000} ₽ ",
              style: MyTextStyle.bigLine1(color: black)),
          TextSpan(
              text: widget.room.pricePer,
              style: MyTextStyle.headLine2S(color: gray))
        ])),
        const SizedBox(height: paddin15),

        //Кнопка выбора номера
        MyButton(text: "Выбрать номер", function: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingScreen()),
              );
        })
      ]),
    );
  }
}

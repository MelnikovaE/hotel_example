import 'package:flutter/material.dart';
import 'package:hotel/presentation/widgets/basic_information_about_hotel.dart';
import 'package:hotel/presentation/widgets/carousel_image.dart';

import '../../../../core/constants.dart';
import '../../../../domain/models/hotel.dart';

class BasicData extends StatefulWidget {
  final Hotel hotel;
  const BasicData({
    super.key,
    required this.hotel,
  });

  @override
  State<BasicData> createState() => _BasicDataState();
}

class _BasicDataState extends State<BasicData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddin15),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Карусель из фотографий
        CarouselImage(images: widget.hotel.imageUrls),
        const SizedBox(
          height: defaultPaddin,
        ),

        //Основные данные про отель
        BasicInformation(
            hotelName: widget.hotel.name,
            adress: widget.hotel.adress,
            ratingName: widget.hotel.ratingName,
            horating: widget.hotel.rating),
        const SizedBox(height: paddin15),

        //Стоимость номеров
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text:
                  "от ${widget.hotel.minimalPrice ~/ 1000} ${widget.hotel.minimalPrice % 1000} ₽ ",
              style: MyTextStyle.bigLine1(color: black)),
          TextSpan(
              text: widget.hotel.priceForIt,
              style: MyTextStyle.headLine2S(color: gray))
        ])),
      ]),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel/core/constants.dart';
import 'package:hotel/presentation/view/hotel/hotel_screen.dart';
import '../widgets/blue_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late int randomNumber;
  @override
  void initState() {
    randomNumber = Random().nextInt(963920);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: black),
        ),
        title: const Text("Заказ оплачен"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                backgroundColor: lightGrayTextFormField,
                radius: 47,
                child: Image.asset(
                  "assets/images/party_popper.png",
                  width: 44,
                  height: 44,
                ),
              ),
              const SizedBox(height: 30),

              Text(
                "Ваш заказ принят в работу",
                style: MyTextStyle.bigLine2(color: black),
              ),
              const SizedBox(height: 25),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
                child: Text(
                  "Подтверждение заказа №$randomNumber может занять некоторое время (от 1 часа до суток). \nКак только мы получим ответ от туроператора, вам на почту придет уведомление.",
                  textAlign: TextAlign.center,
                  style: MyTextStyle.headLine2S(color: gray),
                ),
              ),
            ]),
          ),
          
          const Divider(
            thickness: 1,
            color: grayDivider,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: paddin15, vertical: defaultPaddin / 2),
            child: MyButton(
                text: "Супер!",
                function: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HotelScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }),
          )
        ],
      )),
    );
  }
}

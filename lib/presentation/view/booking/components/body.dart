import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hotel/domain/models/buyer.dart';
import 'package:hotel/presentation/view/booking/components/price_details.dart';
import 'package:hotel/presentation/view/booking/components/tourist_card.dart';
import 'package:hotel/presentation/view/payment_screen.dart';
import 'package:hotel/presentation/widgets/header_and_button.dart';
import '../../../../core/constants.dart';
import '../../../../domain/models/booking.dart';
import '../../../../domain/models/tourist.dart';
import '../../../widgets/basic_information_about_hotel.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/custom_container.dart';
import 'booking_details.dart';
import 'buyer_details.dart';

class BodyLoaded extends StatefulWidget {
  final Booking booking;
  const BodyLoaded({
    super.key,
    required this.booking,
  });

  @override
  State<BodyLoaded> createState() => _BodyLoadedState();
}

class _BodyLoadedState extends State<BodyLoaded> {
  final formKey = GlobalKey<FormState>();
   List<Tourist> tourists = [Tourist.undefined()];
  final Buyer buyer = Buyer(email: "kata02108@gmail.com", phone: "+7 (999) 000-87-61");

  void saveBookingDetails() {
    formKey.currentState!.validate();
    if (!EmailValidator.validate(buyer.email) || buyer.phone.isEmpty) return;
    for (var tourist in tourists) {
      if (tourist.name.isEmpty ||
          tourist.surname.isEmpty ||
          tourist.birthday.length != 10 ||
          tourist.citizenship.isEmpty ||
          tourist.number.length != 10 ||
          tourist.vilidity.length != 10) return;
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PaymentScreen()));
  }

  @override
  Widget build(BuildContext context) {
  final  sum = widget.booking.tourPrice + widget.booking.fuelCharge + widget.booking.serviceCharge;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Блок с отелем
              defaultContainer(
                child: BasicInformation(
                    hotelName: widget.booking.hotelName,
                    adress: widget.booking.hotelAdress,
                    ratingName: widget.booking.ratingName,
                    horating: widget.booking.horating),
              ),

              //Блок с данными брони
              defaultContainer(
                  child: BookingDetails(
                booking: widget.booking,
              )),

              //Блок с данными о покупателе
              defaultContainer(
                  child: BuyerDetails(
                buyer: buyer,
              )),

              //Блок с информацией о туристах
              ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (int i = 0; i < tourists.length; i++)
                      TouristCard(tourist: tourists[i], number: i),
                  ]),

              //Кнопка добавить туриста
              defaultContainer(
                  child: headerAndButton(
                      text: "Добавить туриста",
                      onTap: () {
                        setState(() {
                          tourists.add((Tourist.undefined()));
                        });
                      },
                      icon: Icons.add,
                      color: white,
                      background: blue)),

              //Блок с итоговой ценой
              defaultContainer(child: PriceDetails(booking: widget.booking, sum: sum,)),

              //Кнопка оплаты
              Container(
                color: white,
                margin: const EdgeInsets.only(top: defaultPaddin / 2),
                padding: const EdgeInsets.all(defaultPaddin / 2),
                child: MyButton(
                  text: 'Оплатить ${sum ~/ 1000} ${sum % 1000} ₽',
                  function: saveBookingDetails,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

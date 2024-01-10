import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../bloc/bloc_booking/booking_bloc.dart';
import '../../widgets/body_loading.dart';
import 'components/body.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final BookingBloc _bookingBloc = BookingBloc();

  @override
  void initState() {
    _bookingBloc.add(GetBooking());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrayTextFormField,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: black),
          ),
          title: const Text("Бронирование")),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => _bookingBloc,
        child: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            if (state is BookingError) {
              return Center(
                child: Text(state.error!),
              );
            } else if (state is BookingLoading) {
              return bodyLoading();
            } else if (state is BookingLoaded) {
              return BodyLoaded(booking: state.booking);
            } else {
              return Container(
                color: yellow,
              );
            }
          },
        ),
      )),
    );
  }
}

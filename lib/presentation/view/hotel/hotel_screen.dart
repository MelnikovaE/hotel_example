import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:hotel/core/constants.dart';
import "package:hotel/presentation/bloc/bloc_hotel/hotel_bloc.dart";
import "../../widgets/body_loading.dart";
import "components/body.dart";

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final HotelBloc _hotelBloc = HotelBloc();

  @override
  void initState() {
    _hotelBloc.add(GetHotel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrayTextFormField,
        appBar: AppBar(
          title: const Text(
            "Отель",
          ),
        ),
        body: SafeArea(
            child: BlocProvider(
          create: (context) => _hotelBloc,
          child: BlocBuilder<HotelBloc, HotelState>(
            builder: (context, state) {
              if (state is HotelError) {
                return Center(
                  child: Text(state.error!),
                );
              } else if (state is HotelLoading) {
                return bodyLoading();
              } else if (state is HotelLoaded) {
                return bodyLoaded(context,state.hotel);
              } else {
                return Container(
                  color: yellow,
                );
              }
            },
          ),
        )));
  }
}

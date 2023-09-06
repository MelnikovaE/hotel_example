import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/domen/models/hotel.dart';
import 'package:hotel/presentation/bloc/bloc_room/room_bloc.dart';
import 'package:hotel/presentation/view/room/room_card.dart';
import 'package:hotel/presentation/widgets/body_loading.dart';

import '../../../constants.dart';

class RoomScreen extends StatefulWidget {
  final Hotel hotel;
  const RoomScreen({super.key, required this.hotel});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final RoomBloc _roomBloc = RoomBloc();

  @override
  void initState() {
    _roomBloc.add(GetRoomsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrayTextFormField,
        appBar: AppBar(
          leading:  IconButton(
            onPressed:() {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: black),
          ),
          title: Text(widget.hotel.name),
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (context) => _roomBloc,
            child: BlocBuilder<RoomBloc, RoomState>(
              builder: (context, state) {
                if (state is RoomError) {
                  return Center(
                    child: Text(state.error!),
                  );
                } else if (state is RoomLoading) {
                  return bodyLoading();
                } else if (state is RoomLoaded) {
                  return ListView.builder(
                      itemCount: state.roomsList.length,
                      itemBuilder: (BuildContext context, index) {
                        return RoommCard(room: state.roomsList[index]);
                      });
                } else {
                  return Container(
                    color: yellow,
                  );
                }
              },
            ),
          ),
        ));
  }
}

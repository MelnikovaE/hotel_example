import 'package:flutter/material.dart';
import 'package:hotel/core/constants.dart';

Widget peculiaritieCard({required String text}) {
  return Container(
    padding: const EdgeInsets.symmetric(
        vertical: defaultPaddin / 4, horizontal: defaultPaddin / 2),
    decoration: BoxDecoration(
      color: lightGray,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text( text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'SF',
        color: gray,
      ),
    ),
  );
}

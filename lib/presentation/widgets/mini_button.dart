
import 'package:flutter/material.dart';

Widget miniButton(
    {required Function() tap,
    required IconData icon,
    required Color? color,
    required Color? background}) {
  return GestureDetector(
    onTap: tap,
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: background),
        child: Icon(
          icon,
          color: color,
          size: 30,
        )),
  );
}

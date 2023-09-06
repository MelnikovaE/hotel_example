import 'package:flutter/material.dart';

import '../../constants.dart';

Container defaultContainer({required dynamic child}) => Container(
      margin: const EdgeInsets.only(top: defaultPaddin / 2),
      padding: const EdgeInsets.all(paddin15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );

Container textFormFieldContainer(
        {required dynamic child, required Color color}) =>
    Container(
      height: 52,
      margin: const EdgeInsets.only(
        bottom: defaultPaddin / 2,
      ),
      padding: const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: child,
    );

import 'package:flutter/material.dart';

import '../../core/constants.dart';

TableRow myRow(
        {required String title,
        required String value,
        double padding = 19,
        Color color = black,
        TextAlign align = TextAlign.left}) =>
    TableRow(children: [
      Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: Text(title, style: MyTextStyle.headLine2S(color: gray)),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: Text(value,
            textAlign: align,
            style: MyTextStyle.headLine2S(color: color)),
      )
    ]);

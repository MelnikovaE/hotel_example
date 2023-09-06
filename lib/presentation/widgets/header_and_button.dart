  import 'package:flutter/material.dart';

import '../../constants.dart';
import 'mini_button.dart';

Row headerAndButton(
          {required String text,
          required Function() onTap,
          required IconData icon,
          required Color color,
          required Color background}) =>
      Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: MyTextStyle.bigLine2(color: black),
            ),
          ),
          miniButton(
              tap: onTap, icon: icon, color: color, background: background),
        ],
      );
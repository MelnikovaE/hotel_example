 import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

Widget bodyLoading() {
    return Center(
      child: Shimmer.fromColors(
        baseColor: gray,
        highlightColor: lightGray,
        child: const Text("Загрузка данных...",
            style: TextStyle(
                fontFamily: "SF", fontWeight: FontWeight.w400, fontSize: 30)),
      ),
    );
  }
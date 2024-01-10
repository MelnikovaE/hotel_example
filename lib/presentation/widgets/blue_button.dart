import 'package:flutter/material.dart';
import '../../core/constants.dart';

class MyButton extends StatelessWidget {
  final Function()? function;
  final String text;
  const MyButton({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(blue),
              foregroundColor: MaterialStateProperty.all(white)),
          child: Text(text)),
    );
  }
}

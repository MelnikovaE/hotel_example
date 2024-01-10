import 'package:flutter/material.dart';

//основные отступы
const defaultPaddin = 20.0;
const paddin15 = 15.0;

//основные цвета
const gray = Color.fromRGBO(130, 135, 150, 1);
const grayDivider = Color.fromRGBO(130, 135, 150, 0.15);
const lightGray = Color.fromRGBO(251, 251, 252, 1);
const lightGrayTextFormField = Color.fromRGBO(246, 246, 249, 1);
const graylabelFormField = Color.fromRGBO(169, 171, 183, 1);


const black = Color.fromRGBO(0, 0, 0, 1);
const black_2 = Color.fromRGBO(44, 48, 53, 1);
const blackText = Color.fromRGBO(20, 20, 43, 1);
const white = Color.fromRGBO(255, 255, 255, 1);

const yellow = Color.fromRGBO(255, 168, 0, 1);
const lightYellow = Color.fromRGBO(255, 199, 0, 0.2);

const blue = Color.fromRGBO(13, 114, 255, 1);
const lightBlue = Color.fromRGBO(13, 114, 255, 0.1);

const errorRed = Color.fromRGBO(235, 87, 87, 0.15);


//основные шрифты
class MyTextStyle {
  static TextStyle bigLine1({required Color color}) =>
     TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      fontFamily: 'SF',
      color: color,
    );
  

  static TextStyle bigLine2({required Color color}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.3,
      color: color,
    );


  static const TextStyle headLine1 = TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: black);

  static TextStyle headLine2({required Color color}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'SF',
      color: color,
    );
  

  static TextStyle headLine2S({required Color color}) => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontFamily: 'SF',
      color: color,
    );
  

  static TextStyle headLine3({required Color color}) => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: 'SF',
        color: color);
  
}

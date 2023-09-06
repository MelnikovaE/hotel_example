import 'package:flutter/material.dart';
import 'package:hotel/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';



// TextFormField defaultTextFormField(
//   {
//     required String text,
//     TextInputType? keyboardType =  TextInputType.text,
//     List<TextInputFormatter>? formatter,
//     required String? Function(String?)? validator, 
//     required void Function(String?)? onChanged,
//     required String label
//   }
// ) => TextFormField(
//     style: MyTextStyle.headLine2S(color: blackText),
//     initialValue: text,
//     cursorColor: gray,
//     inputFormatters: formatter,
//     keyboardType: keyboardType,
//     validator: validator,
//     onChanged: onChanged,
//     decoration: formFieldDecoretion(label: label));

InputDecoration formFieldDecoretion({
  required String label,
}) {
  return InputDecoration(
    border: InputBorder.none,
    label: Text(
      label,
      style: MyTextStyle.headLine2S(color: graylabelFormField),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedErrorBorder:InputBorder.none,
  );
}


var maskFormatterPhone = MaskTextInputFormatter(
    mask: '+7 (***) ***-**-**',
    filter: {"*": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

var maskFormatterData = MaskTextInputFormatter(
    mask: '**.**.****',
    filter: {"*": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

    var maskFormatterNumber = MaskTextInputFormatter(
    mask: '** *******',
    filter: {"*": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

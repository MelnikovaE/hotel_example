import 'package:flutter/material.dart';
import 'package:hotel/domen/models/tourist.dart';
import 'package:hotel/presentation/widgets/custom_container.dart';

import '../../../../constants.dart';
import '../../../widgets/default_textformfield.dart';
import '../../../widgets/header_and_button.dart';

class TouristCard extends StatefulWidget {
  final int number;
  final Tourist tourist;
  const TouristCard({super.key, required this.tourist, required this.number});

  @override
  State<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends State<TouristCard> {
  bool visible = true;
  List<Color> colors = List.filled(6, lightGrayTextFormField);

  @override
  Widget build(BuildContext context) {
    return defaultContainer(
      child: visible
          ? Column(children: [
              header(),
              const SizedBox(
                height: paddin15,
              ),
              //Имя
              textFormFieldContainer(
                color: colors[0],
                child: TextFormField(
                    style: MyTextStyle.headLine2S(color: blackText),
                    initialValue: widget.tourist.name,
                    cursorColor: gray,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      setState(() {
                        colors[0] = value != null && value.isEmpty
                            ? errorRed
                            : lightGrayTextFormField;
                      });
                      return null;
                    },
                    onChanged: (value) => widget.tourist.name = value,
                    decoration: formFieldDecoretion(label: "Имя")),
              ),
              //Фамилия
              textFormFieldContainer(
                color: colors[1],
                child: TextFormField(
                    style: MyTextStyle.headLine2S(color: blackText),
                    initialValue: widget.tourist.surname,
                    cursorColor: gray,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      setState(() {
                        colors[1] = value != null && value.isEmpty
                            ? errorRed
                            : lightGrayTextFormField;
                      });
                      return null;
                    },
                    onChanged: (value) => widget.tourist.surname = value,
                    decoration: formFieldDecoretion(label: "Фамилия")),
              ),

              //Дата рождения
              textFormFieldContainer(
                color: colors[2],
                child: TextFormField(
                    style: MyTextStyle.headLine2S(color: blackText),
                    initialValue: widget.tourist.birthday,
                    cursorColor: gray,
                    inputFormatters: [maskFormatterData],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      setState(() {
                        colors[2] = value!.length != 10
                            ? errorRed
                            : lightGrayTextFormField;
                      });
                      return null;
                    },
                    onChanged: (value) => widget.tourist.birthday = value,
                    decoration: formFieldDecoretion(label: "Дата рождения")),
              ),

              //Гражданство
              textFormFieldContainer(
                color: colors[3],
                child: TextFormField(
                    style: MyTextStyle.headLine2S(color: blackText),
                    initialValue: widget.tourist.citizenship,
                    cursorColor: gray,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      setState(() {
                        colors[3] = value != null && value.isEmpty
                            ? errorRed
                            : lightGrayTextFormField;
                      });
                      return null;
                    },
                    onChanged: (value) => widget.tourist.citizenship = value,
                    decoration: formFieldDecoretion(label: "Гражданство")),
              ),

              //Номер загранпаспорта
              textFormFieldContainer(
                color: colors[4],
                child: TextFormField(
                    style: MyTextStyle.headLine2S(color: blackText),
                    initialValue: widget.tourist.number,
                    cursorColor: gray,
                    inputFormatters: [maskFormatterNumber],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      setState(() {
                        colors[4] = value!.length != 10
                            ? errorRed
                            : lightGrayTextFormField;
                      });
                      return null;
                    },
                    onChanged: (value) => widget.tourist.number = value,
                    decoration:
                        formFieldDecoretion(label: "Номер загранпаспорта")),
              ),

              //Срок действия загранпаспорта
              textFormFieldContainer(
                color: colors[5],
                child: TextFormField(
                    style: MyTextStyle.headLine2S(color: blackText),
                    initialValue: widget.tourist.vilidity,
                    cursorColor: gray,
                    inputFormatters: [maskFormatterData],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      setState(() {
                        colors[5] = value!.length != 10
                            ? errorRed
                            : lightGrayTextFormField;
                      });
                      return null;
                    },
                    onChanged: (value) => widget.tourist.vilidity = value,
                    decoration: formFieldDecoretion(
                        label: "Срок действия загранпаспорта")),
              ),
            ])
          : header(),
    );
  }

  Widget header() { 
    List <String> numbers =["Первый", "Второй", "Третий", "Четвёртый", "Пятый", "Шестой"];

    String getNumber(){
      try{
        return numbers[widget.number];
      }catch(e){
          return 'Дополнительный';
      }
    }

    return headerAndButton(
      text: "${getNumber()} турист",
      onTap: () => setState(() {
            visible = !visible;
          }),
      icon: visible ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
      color: blue,
      background: lightBlue);
}}

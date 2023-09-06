import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../domen/models/buyer.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/default_textformfield.dart';

class BuyerDetails extends StatefulWidget {
  final Buyer buyer;
  const BuyerDetails({super.key, required this.buyer});

  @override
  State<BuyerDetails> createState() => _BuyerDetailsState();
}

class _BuyerDetailsState extends State<BuyerDetails> {
  List<Color> colors = [lightGrayTextFormField, lightGrayTextFormField];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Информация о покупателе",
          style: MyTextStyle.bigLine2(color: black),
        ),
        const SizedBox(
          height: paddin15,
        ),

        //Поле для номера телефона
        textFormFieldContainer(
          color: colors[0],
          child: TextFormField(
              style: MyTextStyle.headLine2S(color: blackText),
              initialValue: widget.buyer.phone,
              cursorColor: gray,
              inputFormatters: [maskFormatterPhone],
              keyboardType: TextInputType.text,
              onChanged: (value) {
                widget.buyer.phone = value;
              },
              validator: (value) {
                setState(() {
                  colors[0] =
                      value!.length != 18 ? errorRed : lightGrayTextFormField;
                });
                return null;
              },
              decoration: formFieldDecoretion(label: "Номер телефона")),
        ),

        //Поле для почты
        textFormFieldContainer(
          color: colors[1],
          child: TextFormField(
              style: MyTextStyle.headLine2S(color: blackText),
              initialValue: widget.buyer.email,
              cursorColor: gray,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                widget.buyer.email = value;
              },
              validator: (value) {
                setState(() {
                  colors[1] = value != null && value.isEmpty
                      ? errorRed
                      : EmailValidator.validate(value!)
                          ? lightGrayTextFormField
                          : errorRed;
                  
                });
                return null;
              },
              onEditingComplete: () {
                colors[1] = widget.buyer.email.isNotEmpty &&
                        EmailValidator.validate(widget.buyer.email)
                    ? lightGrayTextFormField
                    : errorRed;
              },
              decoration: formFieldDecoretion(label: "Почта")),
        ),
        Text(
          "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту",
          style: MyTextStyle.headLine3(color: gray),
        ),
      ],
    );
  }
}

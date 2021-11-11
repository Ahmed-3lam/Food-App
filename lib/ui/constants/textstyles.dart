import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';

const TextStyle ktsAvenir = TextStyle(
  fontFamily: "Avenir",
);
const TextStyle ktsAnbold = TextStyle(
  fontFamily: "AvenirAnbold",
);
const TextStyle ktsAvenirDemi = TextStyle(
  fontFamily: "AvenirDemi",
  fontWeight: FontWeight.w500,
);
const TextStyle ktsAnreg = TextStyle(
  fontFamily: "Anreg",
);
const TextStyle ktsAnsemi = TextStyle(
  fontFamily: "Ansemi",
);

const TextStyle nestedBaseStyle = TextStyle(
    fontSize: 17,
    color: kcNestedTabcolor,
    fontFamily: 'Master',
    fontWeight: FontWeight.w600);

class FoodText extends StatelessWidget {
  const FoodText(
    this.text, {
    Key? key,
    this.weight = FontWeight.w400,
    this.color = kcblack,
    this.style = ktsAvenir,
    this.fontSize = 14,
  }) : super(key: key);
  const FoodText.ktsAvenir(
    this.text, {
    Key? key,
    this.weight = FontWeight.w400,
    this.color = kcblack,
    this.style = ktsAvenir,
    this.fontSize = 14,
  }) : super(key: key);
  const FoodText.ktsAvenirDemi(
    this.text, {
    Key? key,
    this.weight = FontWeight.w400,
    this.color = kcblack,
    this.style = ktsAvenirDemi,
    this.fontSize = 14,
  }) : super(key: key);
  const FoodText.ktsAnreg(
    this.text, {
    Key? key,
    this.weight = FontWeight.w400,
    this.color = kcblack,
    this.style = ktsAnreg,
    this.fontSize = 14,
  }) : super(key: key);
  const FoodText.ktsAnsemi(
    this.text, {
    Key? key,
    this.weight = FontWeight.w400,
    this.color = kcblack,
    this.style = ktsAnsemi,
    this.fontSize = 14,
  }) : super(key: key);

  final Color? color;
  final TextStyle? style;
  final double? fontSize;
  final String text;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style!.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
      ),
      textAlign: TextAlign.center,
    );
  }
}

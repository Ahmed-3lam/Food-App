import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';

class TxtField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? isObsecure;
  final Widget? prefix;
  final String hint;
  final TextInputType? typeOfKeybord;
  final int? maxLines;
  final Color? filledColor;
  final TextStyle? hintstyle;
  final BorderSide? borderdecotaion;
  final Color? border;

  TxtField(
      {Key? key,
      this.controller,
      this.suffix,
      this.isObsecure,
      this.prefix,
      required this.hint,
      this.typeOfKeybord,
      this.maxLines = 1,
      this.filledColor = kcwhite,
      this.hintstyle = ktsAnsemi,
      this.borderdecotaion,
      this.border})
      : super(key: key);
  final OutlineInputBorder commonDecor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: kcgrey4, width: 2));

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
        keyboardType: typeOfKeybord,
        controller: controller,
        cursorColor: Colors.black,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintStyle: hintstyle,
            fillColor: filledColor,
            filled: true,
            hintText: hint,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(
                left: 19.13 * .85,
                right: 21 * .85,
                top: 18 * .85,
                bottom: 18 * .85),
            prefixIcon: prefix,
            suffixIcon: suffix,
            enabledBorder: commonDecor.copyWith(
                borderSide: BorderSide(color: filledColor!)),
            disabledBorder: commonDecor.copyWith(
                borderSide: BorderSide(color: filledColor!)),
            focusedBorder: commonDecor.copyWith(
                borderSide: const BorderSide(color: kcred)),
            border: commonDecor.copyWith(
                borderSide: BorderSide(color: filledColor!))));
  }
}

///hlaein diadfkdaidnfadkkfd
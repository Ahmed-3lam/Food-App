import 'package:frontend/Helpers/mlib.dart';

class DialouGeTextFiel extends StatelessWidget {
  final TextEditingController? controller;

  final String hint;
  final TextInputType? typeOfKeybord;
  final int? maxLines;
  final Color? filledColor;
  final TextStyle? hintstyle;

  DialouGeTextFiel({
    Key? key,
    this.controller,
    required this.hint,
    this.typeOfKeybord,
    this.maxLines = 1,
    this.filledColor = kcwhite,
    this.hintstyle = ktsAnreg,
  }) : super(key: key);
  final OutlineInputBorder commonDecor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kcgrey5, width: 1));

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
        keyboardType: typeOfKeybord,
        controller: controller,
        cursorColor: Colors.black,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintStyle: ktsAnsemi.copyWith(fontSize: 11),
            fillColor: filledColor,
            filled: true,
            label: Text(hint),
            hintText: hint,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(
                left: 19.13 * .85,
                right: 21 * .85,
                top: 15 * .85,
                bottom: 15 * .85),
            enabledBorder: commonDecor,
            disabledBorder: commonDecor,
            focusedBorder: commonDecor.copyWith(
                borderSide: const BorderSide(color: kcred)),
            border: commonDecor));
  }
}

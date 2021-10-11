import 'package:frontend/Helpers/mlib.dart';

class RegistrationTextField extends StatelessWidget {
  final TextEditingController? controller;

  final bool? isObsecure;
  final Widget? suffix;
  final Widget? prefix;
  final String hint;
  final TextInputType? typeOfKeybord;

  RegistrationTextField({
    Key? key,
    this.controller,
    this.isObsecure = false,
    required this.hint,
    this.typeOfKeybord,
    this.suffix,
    this.prefix,
  }) : super(key: key);
  final OutlineInputBorder commonDecor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: kcgrey5, width: 2));
  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
        obscureText: isObsecure!,
        keyboardType: typeOfKeybord,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: suffix,
            prefixIcon: prefix,
            hintStyle: ktsAnsemi.copyWith(color: kcgrey5),
            fillColor: kcwhite,
            filled: true,
            hintText: hint,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(
                left: 19.13 * .85,
                right: 21 * .85,
                top: 18 * .85,
                bottom: 18 * .85),
            enabledBorder: commonDecor.copyWith(
                borderSide: BorderSide(color: Colors.grey[400]!, width: 1)),
            disabledBorder: commonDecor.copyWith(
                borderSide: BorderSide(color: Colors.grey[400]!, width: 1)),
            focusedBorder: commonDecor.copyWith(
                borderSide: const BorderSide(color: kcred)),
            border: commonDecor.copyWith(
                borderSide: BorderSide(color: Colors.grey[400]!, width: 1))));
  }
}

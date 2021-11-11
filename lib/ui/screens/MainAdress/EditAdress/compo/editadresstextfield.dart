import 'package:frontend/Helpers/mlib.dart';

class EditAdressTextField extends StatelessWidget {
  const EditAdressTextField({
    Key? key,
    this.controller,
    required this.data,
    required this.hint,
    this.trail,
  }) : super(key: key);
  final TextEditingController? controller;
  final Icon data;
  final String hint;
  final Icon? trail;

  final UnderlineInputBorder comanb = const UnderlineInputBorder(
      borderSide: BorderSide(color: kcdivider, width: 2));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        style: ktsAnreg.copyWith(fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            focusedBorder: comanb.copyWith(
                borderSide: const BorderSide(
              color: kcred,
            )),
            disabledBorder: comanb,
            enabledBorder: comanb,
            border: comanb,
            suffixIcon: trail,
            prefixIconConstraints:
                const BoxConstraints(maxWidth: 30, maxHeight: 20),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: data,
            )),
      ),
    );
  }
}

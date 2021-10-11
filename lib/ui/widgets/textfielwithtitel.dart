import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/ForgotPassword/forgetpassword.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.titel,
    this.prefix,
    this.isObsecure = false,
    this.suffixIcon,
    this.prefixText,
    this.controller,
    this.maxlines = 1,
    this.style,
    this.isPasswordfiel,
    this.verticalpadding = 11.0,
    this.suffix,
    this.isnumberinput = false,
    this.validator,
  }) : super(key: key);
  final bool isObsecure;
  final TextEditingController? controller;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? titel;
  final int? maxlines;
  final TextStyle? style;
  final bool? isPasswordfiel;
  final double? verticalpadding;
  final bool? isnumberinput;
  final Widget? prefix;
  final Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: (titel != null)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      FoodText(
                        titel!,
                        weight: FontWeight.w500,
                        color: Colors.black,
                        fonsize: 13,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                    ])
              : null,
        ),
        TextField(
          onChanged: validator,
          onSubmitted: validator,
          keyboardType: isnumberinput! ? TextInputType.number : null,
          style: ktsAnsemi.merge(style),
          maxLines: maxlines,
          controller: controller,
          obscuringCharacter: "*",
          obscureText: isObsecure,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: kcdivider,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: kcdivider,
                  width: 1,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: kcred,
                  width: 1,
                )),
            prefix: prefix,
            suffix: (suffixIcon != null) ? suffixIcon : null,
            suffixIcon: (suffix != null) ? suffix : null,
            contentPadding: EdgeInsets.only(
                top: verticalpadding!, bottom: verticalpadding!, left: 15),
            prefixText: (prefixText != null) ? prefixText : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  width: 1,
                  color: kcdivider,
                )),
          ),
        ),
        SizedBox(
          child: (isPasswordfiel != null)
              ? GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            RouteX.sliderLeftToRight(
                                context, const ForgotPassWord());
                          },
                          child: const FoodText.ktsAnreg(
                            "Forget Password?",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        )
      ],
    );
  }
}

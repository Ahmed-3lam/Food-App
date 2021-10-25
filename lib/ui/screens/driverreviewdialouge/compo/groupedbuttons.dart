import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontend/Helpers/mlib.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.tittle,
      required this.onTap,
      this.isSelected = false,
      this.style,
      this.inactiveColor = kcgrey3,
      this.activeColor = kcred,
      this.activeStyle = ktsAnsemi,
      this.inactiveStyle = ktsAnsemi})
      : super(key: key);
  final String tittle;
  final VoidCallback onTap;
  final bool? isSelected;
  final TextStyle? style;
  final Color? inactiveColor, activeColor;
  final TextStyle activeStyle, inactiveStyle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
          setState(() {});
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
              height: 40,
              decoration: widget.isSelected!
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.activeColor,
                    )
                  : BoxDecoration(
                      color: widget.inactiveColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
              alignment: Alignment.center,
              child: Text(
                widget.tittle,
                style: widget.isSelected!
                    ? widget.activeStyle
                    : widget.inactiveStyle,
              ),
            ),
          ],
        ));
  }
}

class CustomButtonWrapper extends StatefulWidget {
  const CustomButtonWrapper({
    Key? key,
    required this.buttons,
    required this.blank,
    required this.valueTeller,
    this.isRadio = true,
    required this.onTap,
  }) : super(key: key);
  final List<String> buttons, blank;
  final Function(String?, List<String> val) valueTeller;
  final bool? isRadio;
  final VoidCallback onTap;

  @override
  _CustomButtonWrapperState createState() => _CustomButtonWrapperState();
}

class _CustomButtonWrapperState extends State<CustomButtonWrapper> {
  // List<String> widget.blank = [];
  radio(String tittle) {
    widget.blank.clear();
    widget.blank.add(tittle);
    widget.valueTeller(tittle, widget.blank);
    setState(() {});
  }

  multi(String tittle) {
    if (!widget.blank.contains(tittle)) {
      widget.blank.add(tittle);
    } else {
      widget.blank.remove(tittle);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        ...widget.buttons.map((tittle) => CustomButton(
            inactiveStyle: ktsAnsemi.copyWith(
                color: kcBlack.withOpacity(.80), fontWeight: FontWeight.w500),
            activeStyle:
                ktsAnsemi.copyWith(color: kcwhite, fontWeight: FontWeight.w500),
            isSelected: widget.blank.contains(tittle),
            tittle: tittle,
            onTap: () {
              widget.isRadio! ? radio(tittle) : multi(tittle);
              widget.onTap();
            }))
      ],
    );
  }
}

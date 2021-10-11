import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';

class MasterButton extends StatelessWidget {
  const MasterButton(
      {Key? key,
      this.isOutlined = false,
      this.isBusy = false,
      this.height = 48,
      required this.name,
      required this.onTap,
      this.preFix,
      this.outlinedColor = kcgrey4,
      this.buttonColor = kcred,
      this.radii = 11,
      this.textcolor = kcBlack})
      : super(key: key);
  final bool? isOutlined;
  final bool? isBusy;
  final double? height;
  final String name;
  final VoidCallback onTap;
  final Widget? preFix;
  final Color? outlinedColor;
  final Color? buttonColor;
  final double? radii;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radii!),
        child: MaterialButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          child: Container(
            height: height,
            decoration: !isOutlined!
                ? BoxDecoration(
                    color: isBusy! ? kcgrey3 : buttonColor,
                    borderRadius: BorderRadius.circular(radii!),
                  )
                : BoxDecoration(
                    // color: buttonColor,
                    borderRadius: BorderRadius.circular(radii!),
                    border: Border.all(
                      width: 1,
                      color: buttonColor!,
                    )),
            child: Center(
              child: (preFix != null)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        preFix!,
                        const SizedBox(
                          width: 25,
                        ),
                        Text(name,
                            style: TextStyle(
                                color: isOutlined! ? kcblack : kcwhite))
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: isOutlined!
                          ? Text(
                              name,
                              style: const TextStyle(color: kcred)
                                  .copyWith(color: textcolor, fontSize: 14),
                            )
                          : Text(
                              name,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: isOutlined!
                                      ? textcolor
                                      : isBusy!
                                          ? kcBlack
                                          : kcwhite),
                            ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

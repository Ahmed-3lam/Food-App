import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';

class MasterButton extends StatefulWidget {
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
  State<MasterButton> createState() => _MasterButtonState();
}

class _MasterButtonState extends State<MasterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: !widget.isOutlined!
          ? BoxDecoration(
              color: widget.buttonColor,
              borderRadius: BorderRadius.circular(widget.radii!),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radii!),
              border: Border.all(
                width: 1,
                color: widget.buttonColor!,
              )),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radii!)),
        padding: EdgeInsets.zero,
        onPressed: () {
          setState(() {});
          widget.onTap();
        },
        child: widget.isBusy!
            ? const Center(
                child: CircularProgressIndicator(
                  color: kcwhite,
                ),
              )
            : Center(
                child: (widget.preFix != null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.preFix!,
                          const SizedBox(
                            width: 25,
                          ),
                          Text(widget.name,
                              style: TextStyle(
                                  color:
                                      widget.isOutlined! ? kcblack : kcwhite))
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: widget.isOutlined!
                            ? Text(
                                widget.name,
                                style: const TextStyle(color: kcred).copyWith(
                                    color: widget.textcolor, fontSize: 14),
                              )
                            : Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: widget.isOutlined!
                                        ? widget.textcolor
                                        : widget.isBusy!
                                            ? kcBlack
                                            : kcwhite),
                              ),
                      ),
              ),
      ),
    );
  }
}

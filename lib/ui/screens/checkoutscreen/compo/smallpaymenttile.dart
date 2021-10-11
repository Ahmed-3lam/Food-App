import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/mlib.dart';

class PaymentTile extends StatefulWidget {
  const PaymentTile({
    Key? key,
    required this.name,
    required this.image,
    this.isselected = false,
    this.ontap,
    this.png = false,
  }) : super(key: key);
  final String name, image;
  final bool? isselected;
  final VoidCallback? ontap;
  final bool? png;

  @override
  State<PaymentTile> createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
          width: 120,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                widget.isselected! ? kcred.withOpacity(.1).withBlue(1) : null,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: !widget.isselected! ? const Color(0xffECECEC) : kcred,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: widget.png!
                    ? Image.asset(
                        "asset/properImages/payment/${widget.image}.png",
                        scale: 3,
                      )
                    : SvgPicture.asset(
                        "asset/properImages/payment/${widget.image}.svg",
                        height: 30,
                        width: 30,
                      ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.name,
                style: ktsAnsemi,
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';

class PayMethod extends StatefulWidget {
  const PayMethod({
    Key? key,
    required this.name,
    required this.mail,
    required this.asset,
    required this.ontap,
    required this.isselected,
  }) : super(key: key);
  final String name, mail, asset;
  final VoidCallback ontap;
  final bool isselected;

  @override
  State<PayMethod> createState() => _PayMethodState();
}

class _PayMethodState extends State<PayMethod> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, bottom: 0),
          child: Container(
            height: 85 * .8,
            decoration: BoxDecoration(
              color:
                  widget.isselected ? kcred.withOpacity(.1).withBlue(1) : null,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: !widget.isselected ? const Color(0xffECECEC) : kcred,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 060 * .8,
                  width: 060 * .8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: SvgPicture.asset(
                    "asset/images/checkout/${widget.asset}.svg",
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: ktsAnsemi.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.mail,
                        style: ktsAnsemi.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

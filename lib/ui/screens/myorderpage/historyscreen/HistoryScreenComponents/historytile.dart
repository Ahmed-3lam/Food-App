import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/orderfailed/orderdetails.dart';

import 'rattingwrapper.dart';
import 'reorderdialog.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    Key? key,
    required this.isCancelled,
    required this.name,
    required this.image,
    required this.date,
  }) : super(key: key);
  final bool isCancelled;
  final String name, image, date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteX.fadeIn(context, const OrderFailed());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 121,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        image,
                        scale: 3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ksh16,
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodText.ktsAnsemi(
                          name,
                          fontSize: 16,
                        ),
                        FoodText.ktsAnreg(
                          date,
                          fontSize: 13,
                          // color: kctxtcolor,
                        ),
                        const FoodText.ktsAnreg(
                          "\$150-Item-Cash",
                          fontSize: 13,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            isCancelled
                                ? const SizedBox()
                                : SizedBox(
                                    width: 70,
                                    child: MasterButton(
                                        radii: 10,
                                        textcolor: kcpurpel,
                                        isOutlined: true,
                                        name: "Rate",
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const RateDialog());
                                        },
                                        height: 30,
                                        buttonColor: kcpurpel),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              child: MasterButton(
                                radii: 10,
                                textcolor: kcred,
                                isOutlined: true,
                                name: "Re-Order",
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const ReOrderDialog());
                                },
                                height: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
              CircleAvatar(
                radius: 15,
                child: Icon(
                  isCancelled ? Icons.close : Icons.done,
                  size: 18,
                ),
                backgroundColor: isCancelled ? kcblack : kcred,
                foregroundColor: kcwhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';

class OrdeDetailsTotalSubtotal extends StatelessWidget {
  const OrdeDetailsTotalSubtotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: kpaddinghor17,
        child: Column(
          children: [
            ksv16,
            Row(
              children: const [
                FoodText("Subtotal (1 item)"),
                Spacer(),
                FoodText(
                  "\$150",
                )
              ],
            ),
            ksv10,
            Row(
              children: const [
                FoodText("Ship Fee (1.5km)"),
                Spacer(),
                FoodText("\$150")
              ],
            ),
            ksv10,
            Row(
              children: const [
                FoodText("Discount"),
                Spacer(),
                FoodText("-\$10")
              ],
            ),
            ksv10,
            Row(
              children: const [
                FoodText.ktsAnsemi(
                  "Total",
                  fonsize: 22,
                  weight: FontWeight.w600,
                ),
                Spacer(),
                FoodText(
                  "\$150",
                  weight: FontWeight.w600,
                  color: kcred,
                  fonsize: 22,
                )
              ],
            ),
            ksv10,
          ],
        ),
      ),
    );
  }
}

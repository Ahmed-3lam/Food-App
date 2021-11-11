import 'package:frontend/Helpers/mlib.dart';

class OrdeDetailsTotalSubtotal extends StatelessWidget {
  const OrdeDetailsTotalSubtotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: Padding(
        padding: kpaddinghor17,
        child: Column(
          children: [
            ksv16,
            Row(
              children: const [
                FoodText("Subtotal (1 item)"),
                Spacer(),
                FoodText("\$150")
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
                FoodText.ktsAnsemi(
                  "Total",
                  fontSize: 22,
                ),
                Spacer(),
                FoodText(
                  "\$150",
                  color: kcred,
                  fontSize: 22,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

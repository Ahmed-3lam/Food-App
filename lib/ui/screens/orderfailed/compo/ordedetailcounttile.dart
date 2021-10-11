import 'package:frontend/Helpers/mlib.dart';

class OrderDetailsOrderCountTile extends StatelessWidget {
  const OrderDetailsOrderCountTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kpaddinghor17,
      child: SizedBox(
        height: 65,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                border: Border.all(color: kcpurpel, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: FoodText("1x")),
            ),
            ksh30,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      FoodText.ktsAnreg(
                        "Fried Chicken",
                        fonsize: 16,
                      ),
                      Spacer(),
                      FoodText.ktsAnreg(
                        "\$150",
                        fonsize: 15,
                      ),
                    ],
                  ),
                  const FoodText.ktsAnreg(
                    "Teriyaki sauces",
                    fonsize: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

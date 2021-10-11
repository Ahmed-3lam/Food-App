import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Addpromotioncode/addpromotioncode.dart';

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

class PromoTIle extends StatelessWidget {
  const PromoTIle({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FoodText("Promotion Code"),
            GestureDetector(
              onTap: () {
                RouteX.sliderRighToLeft(context, const AddPromotionCode());
              },
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                height: 35,
                child: const FoodText(
                  'Enter Code',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

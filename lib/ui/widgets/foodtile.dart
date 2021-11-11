import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/widgets/infromationwidget.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    Key? key,
    required this.image,
    required this.name,
    required this.adress,
    required this.startRating,
    required this.discount,
    required this.time,
    required this.distance,
    required this.revieCount,
  }) : super(key: key);
  final String name, image, adress;
  final double startRating, discount, time, distance;
  final int revieCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: SizedBox(
        height: 143,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            SizedBox(
              height: 134,
              child: Row(
                children: [
                  const SizedBox(
                    width: 72,
                  ),
                  Expanded(
                    child: Container(
                      height: 134,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 10, right: 10, left: 82),
                      decoration: BoxDecoration(
                          color: kcwhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: kcTransparent.withOpacity(.13),
                                offset: const Offset(0, 4),
                                blurRadius: 28)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FoodText.ktsAvenir(name),
                              const Spacer(),
                              IConedText(
                                  data: MyFlutterApp.star,
                                  name: "$startRating($revieCount)",
                                  color: kcGolden)
                            ],
                          ),
                          FoodText.ktsAvenir(
                            adress,
                            fontSize: 12,
                            color: kcgrey5,
                          ),
                          Row(
                            children: [
                              FoodText.ktsAvenir(
                                "$time mins ",
                                fontSize: 12,
                              ),
                              FoodText.ktsAvenir(
                                "| $distance kms ",
                                color: kcgrey5,
                                fontSize: 12,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              FoodTileCategoryChip(),
                              FoodTileCategoryChip(),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("asset/images/home/discount_1.png",
                                  scale: 3),
                              const SizedBox(
                                width: 5,
                              ),
                              FoodText.ktsAnreg("$discount% of upto 120",
                                  color: kcFoodTileDiscountTxtcolor
                                      .withOpacity(.72)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 143,
              width: 143,
              child: Container(
                height: 143,
                width: 143,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: kcwhite),
                child: SizedBox(
                  height: 143,
                  width: 143,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(72),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 143,
                          child:
                              Image.asset(image, scale: .8, fit: BoxFit.cover),
                        ),
                        Container(
                          height: 20,
                          width: 65,
                          decoration: BoxDecoration(
                              color: kcOfferRed,
                              borderRadius: BorderRadius.circular(4)),
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Center(
                            child: FoodText(
                              "$discount% OFF",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              fontSize: 11,
                              color: kcwhite,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodTileCategoryChip extends StatelessWidget {
  const FoodTileCategoryChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FoodText("Breakfast", fontSize: 12),
      height: 16,
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: kcSubcategorymark,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

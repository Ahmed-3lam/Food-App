import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Details-choose_desert/details_choose_desert.dart';

class HomeSelctCategorytile extends StatelessWidget {
  const HomeSelctCategorytile({
    Key? key,
    required this.iconData,
    required this.image,
  }) : super(key: key);
  final String iconData;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteX.fadeIn(context, const DetailsChooseDesert());
      },
      child: Column(
        children: [
          Container(
              height: 65,
              width: 65,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: kcwhite,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.transparent.withOpacity(.13),
                        offset: const Offset(0, -4),
                        spreadRadius: 0,
                        blurRadius: 10),
                  ]),
              child: SvgPicture.asset(
                iconData,
                color: kcred,
              )),
          ksv10,
          FoodText(
            image,
            style: ktsAnreg,
          )
        ],
      ),
    );
  }
}

List<String> names = [
  'Gluten Free',
  'Green Tea',
  'Hot-Dog',
  'Ice-Cream',
  'Infysted-Water',
  'Jelly',
  'Juice',
  'Kebab',
  'Keto',
  'Lamb',
  'Lasagna',
  'Lemon Tea',
  'Lobster',
  'Lolipop',
  'Low Carb',
  'Macaroni',
  'Macroon',
  'Margarita',
  'Marshmallow',
  'MeatBall',
  'Mediteranian',
  'Milk',
  'Mineral Water',
  'Mojito',
  'Mushroom',
  'Nachos',
  'No Sugar',
  'Noddle',
];

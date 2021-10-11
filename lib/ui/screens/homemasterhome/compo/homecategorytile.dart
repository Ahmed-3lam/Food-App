import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Details-choose_desert/details_choose_desert.dart';

class HomeSelctCategorytile extends StatelessWidget {
  const HomeSelctCategorytile({
    Key? key,
    required this.iconData,
    required this.image,
  }) : super(key: key);
  final IconData iconData;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteX.sliderRighToLeft(context, const DetailsChooseDesert());
      },
      child: Column(
        children: [
          Container(
              height: 65,
              width: 65,
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
              child: Icon(
                iconData,
                color: kcred,
                size: 30,
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

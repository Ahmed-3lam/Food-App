import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Location-choose_city/locationchoosecity.dart';
import 'package:frontend/ui/screens/profile/profilescren.dart';
import 'package:frontend/ui/utils/icons.dart';

class HomeAdressZone extends StatelessWidget {
  const HomeAdressZone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ksv20,
        Row(children: [
          MaterialButton(
            splashColor: kcTransparent,
            padding: EdgeInsets.zero,
            onPressed: () {
              RouteX.sliderRighToLeft(context, const LocationChooseCity());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      SvgPicture.asset('asset/images/payments/1.svg'),
                      ksh12,
                      const FoodText.ktsAvenir(
                        "Zone II",
                        fonsize: 18,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                const FoodText.ktsAnsemi("123 Avenue Street "),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 35,
            height: 35,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                RouteX.sliderRighToLeft(context, const ProfileScreen());
              },
              child: const Icon(
                MyIcons.profile,
              ),
            ),
          ),
        ]),
        ksv12,
        const Divider(
          color: kcdivider,
          thickness: 2,
        ),
      ],
    );
  }
}

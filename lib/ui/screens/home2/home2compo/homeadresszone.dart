import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/MainAdress/Location-choose_city/locationchoosecity.dart';

class HomeAdressZone extends StatelessWidget {
  const HomeAdressZone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ksv10,
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MaterialButton(
            splashColor: kcTransparent,
            padding: EdgeInsets.zero,
            onPressed: () {
              RouteX.fadeIn(context, const LocationChooseCity());
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
                        fontSize: 18,
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
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'asset/LastIcons/105 – controls.svg',
                height: 25,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/services/my_flutter_app_icons.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/Location-choose_city/locationchoosecity.dart';
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';
import 'package:frontend/ui/screens/searchCopy/searchcopy.dart';
import 'package:frontend/ui/widgets/texfield.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FoodText.ktsAnsemi(
                "Delivery Adrees",
                color: kcwhite,
              ),
              GestureDetector(
                  onTap: () {
                    RouteX.sliderRighToLeft(context, const CloneHome());
                  },
                  child: const Icon(Icons.arrow_right_alt_outlined,
                      color: kcwhite))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                RouteX.sliderRighToLeft(context, const LocationChooseCity());
              },
              child: Row(
                children: [
                  SvgPicture.asset('asset/images/payments/1.svg',
                      color: kcwhite),
                  const SizedBox(
                    width: 7,
                  ),
                  const FoodText.ktsAnsemi(
                    " Avenue street",
                    color: kcwhite,
                    fonsize: 16,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              RouteX.sliderRighToLeft(context, const SearchCopy());
            },
            child: SizedBox(
              child: AbsorbPointer(
                child: TxtField(
                  hint: "Find your favourite one",
                  filledColor: kcgrey3,
                  prefix: Container(
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        'asset/images/payments/2.svg',
                        color: kcblack,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

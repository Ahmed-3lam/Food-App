import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/services/my_flutter_app_icons.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/Location-choose_city/locationchoosecity.dart';
import 'package:frontend/ui/screens/home2/home2.dart';
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
                    RouteX.sliderRighToLeft(context, const Home2());
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
                children: const [
                  Icon(
                    MyFlutterApp.location,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FoodText.ktsAnsemi(
                    "Avenue street",
                    color: kcwhite,
                    fonsize: 16,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
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
                  hint: "Search",
                  hintstyle: ktsAnsemi.copyWith(color: kcicon),
                  filledColor: kcgrey3,
                  prefix: const Icon(
                    MyFlutterApp.search,
                    color: kcicon,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

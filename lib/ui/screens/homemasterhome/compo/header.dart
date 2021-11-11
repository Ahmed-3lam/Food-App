import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/Location-choose_city/locationchoosecity.dart';
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';
import 'package:frontend/ui/screens/notification/notification.dart';
import 'package:frontend/ui/screens/searchCopy/searchcopy.dart';
import 'package:frontend/ui/utils/spaces.dart';
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
            height: 14,
          ),
          Row(
            children: [
              const FoodText.ktsAnsemi(
                "Delivery Adders",
                color: kcwhite,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  RouteX.sliderRighToLeft(context, const NotificationPage());
                },
                child: SvgPicture.asset(
                  'asset/LastIcons/Notification.svg',
                  height: 25,
                  color: Colors.white,
                ),
              ),
              SpaceUtils.ks10.width(),
              GestureDetector(
                  onTap: () {
                    RouteX.sliderRighToLeft(context, const CloneHome());
                  },
                  child: SvgPicture.asset('asset/LastIcons/106 – controls.svg',
                      height: 25, color: kcwhite))
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

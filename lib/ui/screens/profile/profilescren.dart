import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Addpromotioncode/addpromotioncode.dart';
import 'package:frontend/ui/screens/Faqs/faqs.dart';
import 'package:frontend/ui/screens/editprofileinformation/editprofileinformation.dart';
import 'package:frontend/ui/screens/notification/notification.dart';
import 'package:frontend/ui/screens/payment/payment/payment.dart';
import 'package:frontend/ui/screens/preauth/intro/intro.dart';
import 'package:frontend/ui/screens/terms/terms.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              RouteX.sliderRighToLeft(context, const EditeprofielInformation());
            },
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 34),
              alignment: Alignment.center,
              height: 204,
              decoration: const BoxDecoration(
                color: kcred,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      FoodText.ktsAnreg(
                        "Moana Martilue",
                        fonsize: 22,
                        color: kcwhite,
                      ),
                      FoodText(
                        "2565820 | Avenue street",
                        color: kcwhite,
                        fonsize: 12,
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    "asset/images/home/oval.png",
                    scale: 3,
                  )
                ],
              ),
            ),
          ),
          ksv16,
          ProfielTiel(
            name: "My voucher",
            data: MyFlutterApp.tag,
            tap: () {
              RouteX.sliderRighToLeft(context, const AddPromotionCode());
            },
          ),
          ProfielTiel(
            name: "Payment",
            data: Icons.payment,
            tap: () {
              RouteX.sliderRighToLeft(context, const Payment());
            },
          ),
          ksv16,
          const Divider(
            color: kcdivider,
            thickness: 7,
            height: 1,
          ),
          ksv16,
          ProfielTiel(
            name: "Faqs",
            data: Icons.question_answer,
            tap: () {
              RouteX.sliderRighToLeft(context, const Faqs());
            },
          ),
          ProfielTiel(
            name: "Terms and condition",
            data: Icons.padding,
            tap: () {
              RouteX.sliderRighToLeft(context, const TermsCondition());
            },
          ),
          ProfielTiel(
            name: "Terms and condition",
            data: Icons.notifications,
            tap: () {
              RouteX.sliderRighToLeft(context, const NotificationPage());
            },
          ),
          ksv24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MasterButton(
              textcolor: kcred,
              name: 'Log Out',
              onTap: () {
                RouteX.sliderRighToLeft(context, const Intro());
              },
              isOutlined: true,
            ),
          )
        ],
      ),
    );
  }
}

class ProfielTiel extends StatelessWidget {
  const ProfielTiel({
    Key? key,
    required this.data,
    required this.name,
    required this.tap,
  }) : super(key: key);
  final IconData data;
  final String name;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 10),
        onPressed: tap,
        child: SizedBox(
          child: Padding(
            padding: kpaddinghor17,
            child: Row(
              children: [
                Icon(
                  data,
                  color: kcblack.withOpacity(.70),
                ),
                ksh12,
                FoodText.ktsAnreg(
                  name,
                  fonsize: 16,
                ),
                const Spacer(),
                const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      // color: kcicon,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

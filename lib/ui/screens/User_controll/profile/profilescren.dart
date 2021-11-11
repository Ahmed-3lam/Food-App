import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Addpromotioncode/addpromotioncode.dart';
import 'package:frontend/ui/screens/User_controll/Faqs/faqs.dart';
import 'package:frontend/ui/screens/User_controll/editprofileinformation/editprofileinformation.dart';
import 'package:frontend/ui/screens/User_controll/notification/notification.dart';
import 'package:frontend/ui/screens/User_controll/terms/terms.dart';
import 'package:frontend/ui/screens/payment/payment/payment.dart';
import 'package:frontend/ui/screens/preauth/intro/intro.dart';

Color iconColor = kcblack.withOpacity(.75);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              RouteX.fadeIn(context, const EditeprofielInformation());
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
                        fontSize: 22,
                        color: kcwhite,
                      ),
                      FoodText(
                        "2565820 | Avenue street",
                        color: kcwhite,
                        fontSize: 12,
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'asset/images/PlaceHolder/placeholder.jpg',
                        scale: 3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ksv16,
          ProfileTile(
            name: "My voucher",
            data: Icon(
              MyFlutterApp.tag,
              color: iconColor,
            ),
            tap: () {
              RouteX.fadeIn(context, const AddPromotionCode());
            },
          ),
          ProfileTile(
            name: "Payment",
            data: Icon(
              Icons.payment,
              color: iconColor,
            ),
            tap: () {
              RouteX.fadeIn(context, const Payment());
            },
          ),
          ksv16,
          const Divider(
            color: kcdivider,
            thickness: 7,
            height: 1,
          ),
          ksv16,
          ProfileTile(
            name: "Faqs",
            data: Icon(
              Icons.question_answer,
              color: iconColor,
            ),
            tap: () {
              RouteX.fadeIn(context, const Faqs());
            },
          ),
          ProfileTile(
            name: "Terms and condition",
            data: Icon(Icons.padding, color: iconColor),
            tap: () {
              RouteX.fadeIn(context, const TermsCondition());
            },
          ),
          ProfileTile(
            name: "Notifications",
            data: SvgPicture.asset('asset/LastIcons/Notification.svg',
                color: iconColor),
            tap: () {
              RouteX.fadeIn(context, const NotificationPage());
            },
          ),
          ksv24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MasterButton(
              textcolor: kcred,
              name: 'Log Out',
              onTap: () {
                RouteX.fadeIn(context, const Intro());
              },
              isOutlined: true,
            ),
          )
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.data,
    required this.name,
    required this.tap,
  }) : super(key: key);
  final Widget data;
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
                data,
                ksh12,
                FoodText.ktsAnreg(
                  name,
                  fontSize: 16,
                ),
                const Spacer(),
                const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

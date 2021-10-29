import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/screens/auth/otp/otpscreen.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';

class MObileNumber extends StatefulWidget {
  const MObileNumber({Key? key}) : super(key: key);

  @override
  _MObileNumberState createState() => _MObileNumberState();
}

class _MObileNumberState extends State<MObileNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          SpaceUtils.ks120.height(),
          Text(
            'Enter Your\nMobile Number',
            textAlign: TextAlign.center,
            style: FontStyleUtilities.h4(fontWeight: FWT.bold),
          ),
          SpaceUtils.ks75.height(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 48,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.zero,
                    suffixIcon: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          // showOverlayNotification((context) {
                          //   return Card(
                          //     margin: const EdgeInsets.symmetric(horizontal: 4),
                          //     child: SafeArea(
                          //       child: ListTile(
                          //         leading: SizedBox.fromSize(
                          //             size: const Size(40, 40),
                          //             child: ClipOval(
                          //                 child: Container(
                          //               color: kcred,
                          //               child: const Icon(Icons.done,
                          //                   color: kcwhite),
                          //             ))),
                          //         title: Text(
                          //           'OTP has been sent successfully',
                          //           style: FontStyleUtilities.t1(
                          //               fontWeight: FWT.bold),
                          //         ),
                          //         subtitle: Text(
                          //           'Check your messages',
                          //           style: FontStyleUtilities.t3(
                          //               fontWeight: FWT.bold),
                          //         ),
                          //         trailing: IconButton(
                          //             icon: const Icon(Icons.close),
                          //             onPressed: () {
                          //               OverlaySupportEntry.of(context)!
                          //                   .dismiss();
                          //             }),
                          //       ),
                          //     ),
                          //   );
                          // }, duration: const Duration(milliseconds: 2000));
                          RouteX.sliderRighToLeft(context, const OTP());

                          // navigateToPage(context, page: const OTP());
                        },
                        child: Container(
                          child: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.arrow_back,
                              color: kcwhite,
                            ),
                          ),
                          height: 46,
                          width: 46,
                          decoration: const BoxDecoration(
                              color: kcred,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(8))),
                        ),
                      );
                    }),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ),
          SpaceUtils.ks30.height(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'By creating an account, you agree to our’s',
                style: FontStyleUtilities.t2(fontWeight: FWT.semiBold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Privacy Policy ',
                    style: FontStyleUtilities.t2(
                        fontWeight: FWT.bold, fontColor: kcred),
                  ),
                  Text(
                    'and ',
                    style: FontStyleUtilities.t2(fontWeight: FWT.semiBold),
                  ),
                  Text(
                    'Terms of Use',
                    style: FontStyleUtilities.t2(
                        fontWeight: FWT.bold, fontColor: kcred),
                  ),
                ],
              )
            ],
          ),
          SpaceUtils.ks16.height(),
        ],
      ),
    );
  }
}

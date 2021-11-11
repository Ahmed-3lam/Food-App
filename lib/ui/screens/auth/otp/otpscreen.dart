///
import 'dart:async';
import 'package:flutter/material.dart';

///
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';

///
import 'package:pin_code_fields/pin_code_fields.dart';

///
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';

///
import 'package:frontend/ui/screens/auth/otp/timer.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool isBusy = false;
  void setter(bool b) {
    isBusy = b;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).nextFocus();
      },
      child: Scaffold(
          body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                  height: size.height * .35,
                  child: Image.asset('asset/images/illustration/4.png')),
              SpaceUtils.ks16.height(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Text(
                    'OTP Verification',
                    style: FontStyleUtilities.t1(fontWeight: FWT.extrabold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter the OTP sent to ',
                        style: FontStyleUtilities.t1(fontWeight: FWT.medium),
                      ),
                      Text(
                        '+1-123456789',
                        style: FontStyleUtilities.t1(fontWeight: FWT.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SpaceUtils.ks16.height(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  onChanged: (v) {},
                  animationType: AnimationType.none,
                  pinTheme: PinTheme(
                    fieldWidth: 48,
                    fieldHeight: 48,
                    inactiveColor: kcBlack,
                    borderWidth: 1,
                    selectedColor: kcred,
                    activeColor: kcred,
                  ),
                ),
              ),
              const TimerWidget(),
              Container(
                padding: const EdgeInsets.only(bottom: 15, left: 24, right: 24),
                child: Material(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: MasterButton(
                    isBusy: isBusy,
                    onTap: () async {
                      setter(true);
                      await Future.delayed(const Duration(milliseconds: 800));
                      setter(false);
                      RouteX.sliderRighToLeft(context, const MainHome());
                    },
                    name: 'VERIFY & PROCEED',
                  ),
                ),
              ),
              SpaceUtils.ks16.height(),
            ],
          ),
        ),
      )),
    );
  }
}

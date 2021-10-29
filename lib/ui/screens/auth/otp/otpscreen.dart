import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool isBusy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 15, left: 24, right: 24),
          child: MasterButton(
            isBusy: isBusy,
            onTap: () async {
              isBusy = true;
              setState(() {});
              await Future.delayed(const Duration(milliseconds: 1000));
              isBusy = false;
              setState(() {});
              print('signin in');
              RouteX.sliderBottomToTop(context, const MainHome());
            },
            name: 'Confirm',
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            SpaceUtils.ks120.height(),
            Text(
              'OTP\nVerification',
              textAlign: TextAlign.center,
              style: FontStyleUtilities.h4(fontWeight: FWT.bold),
            ),
            SpaceUtils.ks75.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Code is sent to ',
                  style: FontStyleUtilities.t2(fontWeight: FWT.semiBold),
                ),
                Text(
                  '+1 123456789',
                  style: FontStyleUtilities.t2(fontWeight: FWT.bold),
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
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SpaceUtils.ks16.height(),
            const TimerWidget()
          ],
        ));
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int myCount = 60;

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (myCount != 0) {
        myCount--;
        setState(() {});
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Code valid for $myCount',
          style: FontStyleUtilities.t2(fontWeight: FWT.bold),
        ),
        SpaceUtils.ks16.height(),
        myCount == 0
            ? TextButton(
                onPressed: () {
                  myCount = 60;
                  setState(() {});
                  startTimer();
                },
                child: Text(
                  'Resend',
                  style: FontStyleUtilities.t2(
                      fontWeight: FWT.bold, fontColor: kcred),
                ))
            : const SizedBox()
      ],
    );
  }
}

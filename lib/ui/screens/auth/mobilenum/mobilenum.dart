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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).nextFocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
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
                // SpaceUtils.ks120.height(),
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
                      style: FontStyleUtilities.h5(fontWeight: FWT.extrabold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'We will send you an OTP ',
                          style:
                              FontStyleUtilities.t1(fontWeight: FWT.semiBold),
                        ),
                        Text(
                          '+1-123456789',
                          style: FontStyleUtilities.t1(fontWeight: FWT.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'on this mobile number',
                  style: FontStyleUtilities.t1(fontWeight: FWT.semiBold),
                ),
                SpaceUtils.ks24.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter Mobile Number',
                        style: FontStyleUtilities.t2(fontWeight: FWT.semiBold),
                      ),
                    ],
                  ),
                ),
                SpaceUtils.ks16.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: 10, left: 20),
                          prefixIconConstraints:
                              const BoxConstraints(maxHeight: 40),
                          prefixIcon: Text(
                            '+1  ',
                            style: FontStyleUtilities.t1(fontWeight: FWT.bold),
                          ),
                          border: const UnderlineInputBorder()),
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
                          style:
                              FontStyleUtilities.t2(fontWeight: FWT.semiBold),
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
                SpaceUtils.ks30.height(),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 8,
                        child: MasterButton(
                            name: 'GET OTP',
                            onTap: () {
                              RouteX.fadeIn(context, const OTP());
                            })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

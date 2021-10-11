import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/constants/paddings.dart';
import 'package:frontend/ui/screens/Resetpassword/resetpassword.dart';
import 'package:frontend/ui/widgets/button.dart';

class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: MyICondeButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              MyFlutterApp.arrowback,
              color: kcblack,
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: kpadding,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ksv24,
                    const FoodText(
                      "Forgot Password",
                      fonsize: 28,
                      weight: FontWeight.w400,
                    ),
                    ksv24,
                    const FoodText.ktsAnsemi(
                      "Please enter your email address.\nYou will receive a link to create\na new password via email",
                      color: kctxtcolor,
                      weight: FontWeight.w600,
                    ),
                    ksv20,
                    RegistrationTextField(hint: "example@gmail.com"),
                    ksv20,
                    MasterButton(
                        name: "Send",
                        onTap: () {
                          RouteX.sliderRighToLeft(
                              context, const ResetPassWord());
                        })
                  ]),
            ),
          ),
        ));
  }
}

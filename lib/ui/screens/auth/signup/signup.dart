import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Home_main/home_main.dart';
import 'package:frontend/ui/widgets/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isobsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: kpadding,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const FoodText.ktsAnreg(
                      "Sign Up",
                      fontSize: 30,
                      weight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RegistrationTextField(hint: "User Name"),
                    const SizedBox(
                      height: 20,
                    ),
                    RegistrationTextField(hint: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    RegistrationTextField(
                      isObsecure: isobsecure,
                      hint: "Password",
                      suffix: MyICondeButton(
                          onPressed: () {
                            isobsecure = !isobsecure;
                            setState(() {});
                          },
                          icon: const Icon(
                            MyFlutterApp.eye,
                            size: 14,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MasterButton(
                        name: "Confirm",
                        onTap: () {
                          RouteX.fadeIn(context, const MainHome());
                        })
                  ]),
            ),
          ),
        ));
  }
}

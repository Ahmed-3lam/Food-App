import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/auth/ForgotPassword/forgetpassword.dart';
import 'package:frontend/ui/screens/auth/signup/signup.dart';
import 'package:frontend/ui/screens/Home_main/home_main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isBusy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kpadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 20,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    ks30,
                    const FoodText.ktsAnreg(
                      "Sign In",
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    ks30,
                    ks30,
                    RegistrationTextField(
                      hint: "User Name",
                    ),
                    ks30,
                    RegistrationTextField(
                      hint: "Password",
                      isObsecure: true,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              RouteX.fadeIn(context, const ForgotPassWord());
                            },
                            child: const FoodText("Forgot Password?"))
                      ],
                    ),
                    ks30,
                    MasterButton(
                        isBusy: isBusy,
                        name: "Sign In",
                        onTap: () async {
                          isBusy = true;
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 1000));
                          isBusy = false;
                          setState(() {});
                          print('signin in');
                          RouteX.sliderBottomToTop(context, const MainHome());
                        }),
                    ks30,
                    const SizedBox(height: 10),
                    const Text(
                      "OR",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    ks30,
                    MasterButton(
                      buttonColor: kcpurpel,
                      name: "Sign In With FaceBook",
                      onTap: () {},
                      preFix: const Icon(
                        MyFlutterApp.fb,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    MasterButton(
                        buttonColor: kcgrey5,
                        isOutlined: true,
                        name: "Sign In With Google    ",
                        onTap: () {},
                        preFix: Image.asset(
                          "asset/images/signin/google.png",
                          scale: 2,
                        )),
                    ks30,
                    const SizedBox(),
                    const Spacer(
                      flex: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                            onPressed: () {
                              RouteX.fadeIn(context, const SignUp());
                            },
                            child: const Text(
                              "Sign up Now!",
                            ))
                      ],
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const SizedBox ks30 = SizedBox(height: 20);

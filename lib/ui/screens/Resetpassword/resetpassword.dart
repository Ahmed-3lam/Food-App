import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Signin/signinscreen.dart';
import 'package:frontend/ui/screens/comancontainerpage/comancontainerizedpage.dart';
import 'package:frontend/ui/widgets/textfielwithtitel.dart';

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComanContaineraziedPag(children: [
      const FoodText.ktsAnsemi(
        "Add New Password",
        fonsize: 18,
      ),
      ksv20,
      const MyTextField(
        isObsecure: true,
        titel: "New Password",
      ),
      ksv20,
      const MyTextField(
        isObsecure: true,
        titel: "Retype Password",
      ),
      ksv20,
      MasterButton(
          name: "Done",
          onTap: () {
            RouteX.sliderLeftToRight(context, const SignInPage());
          })
    ], appbarTitel: "New Password");
  }
}

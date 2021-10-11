import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Signin/signinscreen.dart';

import 'package:frontend/ui/screens/intro/compo/indicators.dart';
import 'package:frontend/ui/widgets/button.dart';

class Intor extends StatefulWidget {
  const Intor({Key? key}) : super(key: key);

  @override
  State<Intor> createState() => _IntorState();
}

class _IntorState extends State<Intor> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ksv16,
            SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (i) {
                    index = i;
                    setState(() {});
                  },
                  itemBuilder: (context, i) => Image.asset(
                        "asset/images/illustration/illu.png",
                        scale: 3,
                      )),
            ),
            ksv18,
            IndicatorsOfIntro(index: index),
            ksv20,
            const FoodText.ktsAnreg(
              "Find all restaurent\nin one app",
              fonsize: 24,
            ),
            ksv18,
            const FoodText("Choose your favourite restaurant",
                color: kctxtcolor),
            ksv20,
            Padding(
              padding: kpaddinghor20,
              child: MasterButton(
                  name: "Sign In",
                  onTap: () {
                    RouteX.sliderBottomToTop(context, const SignInPage());
                  }),
            ),
            ksv16,
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: TextStyle(color: kcred, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}

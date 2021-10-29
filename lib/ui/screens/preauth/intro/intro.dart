import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/auth/mobilenum/mobilenum.dart';

import 'package:frontend/ui/widgets/button.dart';

import 'compo/indicators.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
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
                    RouteX.sliderBottomToTop(context, const MObileNumber());
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

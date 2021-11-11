import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/preauth/goal/goal.dart';
import 'package:frontend/ui/screens/preauth/intro/compo/data.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import 'compo/commonpage.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcred,
      body: SafeArea(
        child: Column(
          children: [
            ksv16,
            Expanded(
              child: SizedBox(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (i) {
                    index = i;

                    ///WE ARE AVOIDING TO CALL THE SET STATE METHOD IN THE PLACE
                    ///OF THIS WE ARE WRAPPING THE CIRCULAR PROGRESS INDICATOR
                    ///IN ANIMATED BUILDER SO IN THE PLACE OF BUILDING COMPLETE
                    ///PAGE AGAIN IT WILL BE CALLED IN JUST THAT PORTION...
                    // setState(() {};
                  },
                  children: [
                    CommonIntoPage(
                      model: intros[0],
                    ),
                    CommonIntoPage(
                      model: intros[1],
                    ),
                    CommonIntoPage(
                      model: intros[2],
                    ),
                  ],
                ),
              ),
            ),
            ksv30,
            AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) => CircularPercentIndicator(
                radius: 78,
                backgroundColor: Colors.transparent,
                animation: true,
                animateFromLastPercent: true,
                percent: (.33 * (index + 1)).clamp(0, 1),
                progressColor: kcwhite,
                lineWidth: 6,
                circularStrokeCap: CircularStrokeCap.round,
                center: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                      backgroundColor: kcwhite,
                      onPressed: () {
                        if (index == 2) {
                          RouteX.fadeIn(context, const GOALScreen());
                        } else {
                          _pageController.animateToPage(index + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate);
                        }
                      },
                      child: index == 2
                          ? const Icon(
                              Icons.done_all,
                              size: 30,
                              color: kcred,
                            )
                          : const RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: kcred,
                              ),
                            )),
                ),
              ),
            ),
            ksv30,
            ksv20,
          ],
        ),
      ),
    );
  }
}

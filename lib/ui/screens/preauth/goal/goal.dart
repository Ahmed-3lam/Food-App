///
import 'package:flutter/material.dart';

///
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';

///
import 'package:frontend/ui/screens/auth/mobilenum/mobilenum.dart';

///
import 'compo/goaldescription.dart';
import 'compo/smallrotatingimage.dart';

class GOALScreen extends StatefulWidget {
  const GOALScreen({Key? key}) : super(key: key);

  @override
  _GOALScreenState createState() => _GOALScreenState();
}

class _GOALScreenState extends State<GOALScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  void onPageChange(int index) {
    currentIndex = index;
    setState(() {});
  }

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..addListener(() {});
    _animation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ///WE WANT TO CALL FORWARD IN TWO CASE 1.WHEN PAGE BUILDS FIST TIME AND
    ///WHEN USER RE-ENTERS AFTER VISITING SUCCESSIVE PAGE IN NAVIGATION STACK
    ///SO IT WILL WORK AS EXPECTED.....

    _controller.forward();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: kcred,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Transform.translate(
                  offset: Offset(0, -_animation.value * size.height),
                  child: Text(
                    'FOOD APP',
                    style: FontStyleUtilities.h2(
                        fontWeight: FWT.bold, fontColor: kcwhite),
                  ),
                ),
              ),
              SpaceUtils.ks30.height(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                height: 73 + 344 + 25,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ///THIS WIDGET REPRESENT THE TEXT WRITTEN INSIDE THE TAB VIEW
                    ///AND DOWN TO FOOD APP IMAGE...

                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(
                            _animation.value *
                                MediaQuery.of(context).size.width /
                                1,
                            0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 20),
                          padding: const EdgeInsets.only(
                              top: 73 + 73 + 20, bottom: 65),
                          height: 334 + 73 + 20,
                          decoration: BoxDecoration(
                            color: kcred,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            children: [
                              SpaceUtils.ks30.height(),
                              const SizedBox(
                                width: double.infinity,
                              ),
                              Expanded(

                                  ///HERE PAGE VIEW IS USED FOR AVOIDING REBUILDS
                                  ///ON CHANGE.....
                                  child: PageView(
                                onPageChanged: onPageChange,
                                children: const [
                                  GOALDescription(),
                                  GOALDescription(),
                                  GOALDescription(),
                                ],
                              )),
                              SpaceUtils.ks30.height(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                      3,
                                      (index) => Indicator(
                                          isHighlighted: index == currentIndex))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///THIS WIDGET REPRESENT THE CENTERED IMAGE IN THE SCREEN JUST
                    ///BELOW FOOD APP TEXT
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(0, -size.height / 2 * _animation.value),
                        child: Transform(
                          origin: const Offset(73, 73),
                          transform: Matrix4.identity()
                            ..rotateZ(_animation.value * 2 * 3.14),
                          child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.all(6),
                              height: 146,
                              width: 146,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(73),
                                child: Image.asset(
                                  'asset/images/PlaceHolder/placeholder.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: kcTransparent.withOpacity(.13),
                                        offset: const Offset(2, 4),
                                        blurRadius: 10)
                                  ],
                                  border: Border.all(color: kcred),
                                  color: kcwhite,
                                  shape: BoxShape.circle)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          _controller.reverse();
                          await Future.delayed(
                              const Duration(milliseconds: 1200));
                          RouteX.fadeIn(context, const MObileNumber(),
                              shouldMaintain: false);
                        },
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) => Transform.translate(
                            offset: Offset(
                                -MediaQuery.of(context).size.width *
                                    _animation.value,
                                0),
                            child: Container(
                              child: Center(
                                  child: Text(
                                'LET\'S VERIFY',
                                style: FontStyleUtilities.h5(
                                    fontColor: kcwhite, fontWeight: FWT.bold),
                              )),
                              decoration: BoxDecoration(
                                  color: kcred,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: kcwhite)),
                              height: 50,
                              width: 155,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),

        ///DIRECT CHILD OF STACK....
        ///THIS ARE SMALL ROTATING DISCS ON THE SCREEN...
        const Align(
          alignment: Alignment(-1.6, 1),
          child: SmallRotatingImage(
            image: 'asset/images/dishes/dish3.jpg',
            isLeft: false,
          ),
        ),

        ///THIS ARE SMALL ROTATING DISCS ON THE SCREEN...
        const Align(
          alignment: Alignment(
            1.6,
            -.10,
          ),
          child: SmallRotatingImage(
            image: 'asset/images/dishes/dish6.jpg',
            isLeft: false,
          ),
        ),

        ///THIS ARE SMALL ROTATING DISCS ON THE SCREEN...
        const Align(
          alignment: Alignment(
            -1.3,
            -1,
          ),
          child: SmallRotatingImage(
            image: 'asset/images/dishes/dish4.jpg',
            isLeft: false,
          ),
        ),
      ],
    ));
  }
}

///WE ARE NOT EXTRACTING THIS AS COMPONENT DUE TO SMALL USE CASE....
class Indicator extends StatefulWidget {
  const Indicator({Key? key, required this.isHighlighted}) : super(key: key);
  final bool isHighlighted;
  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              widget.isHighlighted ? kcwhite : Colors.black.withOpacity(.10)),
    );
  }
}

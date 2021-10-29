import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/screens/preauth/intro/intro.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';

class GOALScreen extends StatefulWidget {
  const GOALScreen({Key? key}) : super(key: key);

  @override
  _GOALScreenState createState() => _GOALScreenState();
}

class _GOALScreenState extends State<GOALScreen> {
  int currentIndex = 0;
  void onPageChange(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'FERN',
          style: FontStyleUtilities.h1(fontWeight: FWT.semiBold),
        ),
        SpaceUtils.ks30.height(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 73 + 344,
          width: MediaQuery.of(context).size.width,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 73 + 344 + 40),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 73, bottom: 20),
                  padding: const EdgeInsets.only(top: 73, bottom: 60),
                  height: 334,
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
                Positioned(
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 146,
                        width: 146,
                        child: Image.network(
                            'https://fluttertop.com/wp-content/uploads/2021/09/cropped-jai.png'),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: kcTransparent.withOpacity(.13),
                                  offset: const Offset(2, 4),
                                  blurRadius: 10)
                            ],
                            border: Border.all(color: kcred),
                            color: kcwhite,
                            shape: BoxShape.circle))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      RouteX.sliderRighToLeft(context, const Intro());
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        'LET\'S START',
                        style: FontStyleUtilities.h6(
                            fontColor: kcwhite, fontWeight: FWT.semiBold),
                      )),
                      decoration: BoxDecoration(
                          color: kcred,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: kcwhite)),
                      height: 40,
                      width: 155,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SpaceUtils.ks65.height(),
        Text(
          'POWERED BY\nFLUTTER TOP',
          style: FontStyleUtilities.h5(fontWeight: FWT.semiBold),
        )
      ],
    ));
  }
}

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

class GOALDescription extends StatelessWidget {
  const GOALDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcTransparent,
      child: Column(children: [
        Text(
          'Welcome To\nGet App On Lease',
          textAlign: TextAlign.center,
          style: FontStyleUtilities.h3(
              fontColor: kcwhite, fontWeight: FWT.semiBold),
        ),
        SpaceUtils.ks16.height(),
        Text(
          'GOAL is a place where you get best\nuser experience app for rent.',
          textAlign: TextAlign.center,
          style: FontStyleUtilities.t2(
              fontColor: kcwhite, fontWeight: FWT.semiBold),
        )
      ]),
    );
  }
}

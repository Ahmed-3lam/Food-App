import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/details/details.dart';

import 'carouselwidget.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late PageController pageController;
  late PageController carouselController;
  late ScrollController scrollController;
  int curentIndex = 0;

  @override
  void initState() {
    scrollController = ScrollController()..addListener(() {});
    pageController = PageController();
    carouselController = PageController(viewportFraction: .90);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350 * .85,
          child: PageView.builder(
            onPageChanged: (indexer) {
              curentIndex = indexer;
              setState(() {});
            },
            itemCount: 3,
            controller: carouselController,
            itemBuilder: (context, int index) => GestureDetector(
                onTap: () {
                  RouteX.sliderRighToLeft(context, const Details());
                },
                child: HomeCarouselItem(pageChanged: index == curentIndex)),
          ),
        ),
        Indicator(carouselIndex: curentIndex),
      ],
    );
  }
}

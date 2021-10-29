import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
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
          width: MediaQuery.of(context).size.width,
          height: 350 * .85,
          child: CarouselSlider.builder(
            itemCount: dishes.length,
            options: CarouselOptions(
                initialPage: 2,
                viewportFraction: .90,
                height: 350 * .85,
                pageViewKey: const PageStorageKey('The page storage key'),
                autoPlay: true,
                onPageChanged: (index, reason) {
                  curentIndex = index;
                  setState(() {});
                }),
            itemBuilder: (context, int index, i) => GestureDetector(
                onTap: () {
                  RouteX.sliderRighToLeft(
                      context,
                      Details(
                        image: dishes[index].image,
                      ));
                },
                child: HomeCarouselItem(
                  key: ValueKey(dishes[index].image),
                  pageChanged: index == curentIndex,
                  image: dishes[index].image,
                )),
          ),
        ),
        Indicator(carouselIndex: curentIndex),
      ],
    );
  }
}

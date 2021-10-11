import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/widgets/infromationwidget.dart';

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem({
    Key? key,
    required this.pageChanged,
  }) : super(key: key);
  final bool pageChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(
        milliseconds: 500,
      ),
      padding: pageChanged
          ? const EdgeInsets.only(bottom: 0)
          : const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("asset/images/home/pizza.png"),
            ),
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30)),
            child: const InformationWidget(),
          ),
        ),
      ),
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
    required this.index,
    required this.pageindex,
  }) : super(key: key);
  final int index;
  final int pageindex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: index == pageindex ? 010 : 8,
          width: index == pageindex ? 010 : 8,
          decoration: BoxDecoration(
              color: index == pageindex ? kcred : kcgrey5,
              shape: BoxShape.circle)),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.carouselIndex,
  }) : super(key: key);

  final int carouselIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IndicatorWidget(
            index: 0,
            pageindex: carouselIndex,
          ),
          IndicatorWidget(
            index: 1,
            pageindex: carouselIndex,
          ),
          IndicatorWidget(
            index: 2,
            pageindex: carouselIndex,
          ),
        ],
      ),
    );
  }
}

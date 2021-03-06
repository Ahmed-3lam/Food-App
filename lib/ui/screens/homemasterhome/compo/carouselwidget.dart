import 'package:flutter/material.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/widgets/infromationwidget.dart';

class HomeCarouselItem extends StatefulWidget {
  const HomeCarouselItem({
    Key? key,
    required this.pageChanged,
    required this.image,
  }) : super(key: key);
  final bool pageChanged;
  final String image;

  @override
  State<HomeCarouselItem> createState() => _HomeCarouselItemState();
}

class _HomeCarouselItemState extends State<HomeCarouselItem> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(widget.image), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(
        milliseconds: 500,
      ),
      padding: widget.pageChanged
          ? const EdgeInsets.only(bottom: 0)
          : const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              height: 350 * .85,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'asset/images/PlaceHolder/placeholder.jpg',
                  key: ValueKey(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
              child: const InformationWidget(),
            )
          ],
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
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dishes.length,
            itemBuilder: (context, i) =>
                IndicatorWidget(index: i, pageindex: carouselIndex),
          ),
        ],
      ),
    );
  }
}

/// String image =
///     'https://images.unsplash.com/photo-1519077336050-4ca5cac9d64f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80s';
/// String image2 =
///     'https://images.unsplash.com/photo-1564671165093-20688ff1fffa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1898&q=80';
/// String image3 =
///     'https://images.unsplash.com/photo-1617474019977-0e105d1b430e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=362&q=80';

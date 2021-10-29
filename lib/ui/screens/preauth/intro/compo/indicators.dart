import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';

class IndicatorsOfIntro extends StatelessWidget {
  const IndicatorsOfIntro({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IndicatorWidget(index: 0, pageindex: index),
        IndicatorWidget(index: 1, pageindex: index),
        IndicatorWidget(index: 2, pageindex: index),
      ],
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

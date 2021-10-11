import 'package:flutter/material.dart';
import 'package:frontend/services/my_flutter_app_icons.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/widgets/childspacer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailsReview extends StatelessWidget {
  const DetailsReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          MyFlutterApp.star,
                          color: kcGolden,
                          size: 40,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "4.9",
                          style: TextStyle(fontSize: 30, color: kcred),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text(
                      "Based on",
                    ),
                    const Text('234 Review')
                  ]),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
              flex: 3,
              child: SizedBox(
                child: Column(
                    children: childSpacer([
                  const DetailsDeliveryRatingPercent(
                    percent: .9,
                    leading: 5,
                  ),
                  const DetailsDeliveryRatingPercent(
                    percent: .7,
                    leading: 4,
                  ),
                  const DetailsDeliveryRatingPercent(
                    percent: .5,
                    leading: 3,
                  ),
                  const DetailsDeliveryRatingPercent(
                    percent: .3,
                    leading: 2,
                  ),
                  const DetailsDeliveryRatingPercent(
                    percent: .1,
                    leading: 1,
                  ),
                ], 2)),
              ))
        ],
      ),
    );
  }
}

class DetailsDeliveryRatingPercent extends StatefulWidget {
  const DetailsDeliveryRatingPercent({
    Key? key,
    required this.percent,
    required this.leading,
  }) : super(key: key);
  final double percent;
  final int leading;

  @override
  State<DetailsDeliveryRatingPercent> createState() =>
      _DetailsDeliveryRatingPercentState();
}

class _DetailsDeliveryRatingPercentState
    extends State<DetailsDeliveryRatingPercent> {
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      linearStrokeCap: LinearStrokeCap.round,
      lineHeight: 8,
      progressColor: kcpurpel,
      backgroundColor: kcdivider,
      curve: Curves.linearToEaseOut,
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 700,
      percent: widget.percent,
      leading: Text("${widget.leading}"),
    );
  }
}

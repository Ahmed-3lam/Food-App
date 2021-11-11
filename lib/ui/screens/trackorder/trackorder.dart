import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/widgets/appbar.dart';

import 'compo/linearstatustrackerwidget.dart';
import 'compo/trackorderdriverinfo.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  final int status = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "Track your Order"),
      body: Padding(
        padding: kpadding,
        child: Column(
          children: [
            const TrackOrderDriverInfo(),
            ksv30,
            SizedBox(
              height: 350,
              child: Row(
                children: [
                  TrackerWidget(status: status),
                  ksh12,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TrackerWidgetText(
                          titel: "Order confirmed",
                          sutite: "Your Order has been received"),
                      TrackerWidgetText(
                          titel: "Order Prepared",
                          sutite: "Your Order has been prepared"),
                      TrackerWidgetText(
                          titel: "Order In Progress",
                          sutite: "Your food is on the way to you"),
                      TrackerWidgetText(
                          titel: "Delivered",
                          sutite: "Wish you have an interesting experience"),
                      TrackerWidgetText(
                          titel: "Rate Us",
                          sutite: "Help us improve our service"),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrackerWidgetText extends StatelessWidget {
  const TrackerWidgetText({Key? key, required this.titel, required this.sutite})
      : super(key: key);
  final String titel, sutite;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodText.ktsAnreg(
          titel,
          fontSize: 16,
        ),
        FoodText(
          sutite,
          color: kctxtcolor,
        ),
      ],
    );
  }
}

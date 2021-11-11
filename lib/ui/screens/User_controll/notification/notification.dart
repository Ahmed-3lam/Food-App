import 'package:flutter/material.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';
import 'package:frontend/ui/widgets/appbar.dart';
import 'package:frontend/ui/widgets/commonshadowcontainer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Notifications'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceUtils.ks20.height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'New Notification',
                style: FontStyleUtilities.h6(fontWeight: FWT.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationTile(
                  notificationModel: notifications[index],
                );
              },
            ),
            SpaceUtils.ks20.height(),
            SpaceUtils.ks20.height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Earlier Notification',
                style: FontStyleUtilities.h6(fontWeight: FWT.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationTile(
                  notificationModel: notifications[index],
                );
              },
            ),
            SpaceUtils.ks100.height(),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key, required this.notificationModel})
      : super(key: key);
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      margin: const EdgeInsets.only(top: 10, left: 24, right: 24),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationModel.tittle,
            style: FontStyleUtilities.t2(fontWeight: FWT.semiBold),
          ),
          SpaceUtils.ks7.height(),
          Text(
            notificationModel.time,
            style: FontStyleUtilities.t2(),
          ),
        ],
      ),
    );
  }
}

List<NotificationModel> notifications = [
  NotificationModel(
    time: '11:30 PM',
    tittle: 'Your reorder is successfully placed.',
  ),
  NotificationModel(
    time: '9:30 PM',
    tittle: 'Huge discounts are coming soon.',
  ),
  NotificationModel(
    time: '10:30 PM',
    tittle: 'Your order is placed successfully.',
  ),
  NotificationModel(
    time: '8:30 PM',
    tittle: 'Order placed successfully',
  ),
  NotificationModel(
    time: '7:30 PM',
    tittle: 'Your refunds are credited to your account with ending **2038.',
  ),
];

class NotificationModel {
  NotificationModel({
    required this.time,
    required this.tittle,
  });
  final String tittle, time;
}

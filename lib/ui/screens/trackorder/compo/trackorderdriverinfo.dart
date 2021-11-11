import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/messagescreen/message.dart';

class TrackOrderDriverInfo extends StatelessWidget {
  const TrackOrderDriverInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kpaddinghor10,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcgrey2),
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'asset/images/PlaceHolder/placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  FoodText("John Nguyen ",
                      fontSize: 14,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  FoodText(" (Driver)",
                      fontSize: 14,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                ],
              ),
              const FoodText("is heading to you",
                  fontSize: 14, style: TextStyle(fontWeight: FontWeight.w400)),
            ],
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: kcpurpel,
              radius: 18,
              foregroundColor: kcwhite,
              child: Icon(MyFlutterApp.call),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              RouteX.fadeIn(context, const MessageScreen());
            },
            icon: const CircleAvatar(
              backgroundColor: kcpurpel,
              radius: 18,
              foregroundColor: kcwhite,
              child: RotatedBox(
                  quarterTurns: -4, child: Icon(MyFlutterApp.chat, size: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

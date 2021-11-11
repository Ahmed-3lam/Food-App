import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/messagescreen/message.dart';
import 'package:frontend/ui/screens/trackorder/trackorder.dart';

class OrderTrackingTile extends StatelessWidget {
  const OrderTrackingTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding:
              const EdgeInsets.only(bottom: 15, left: 10, top: 10, right: 10),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kcwhite,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(2, 5),
                    color: Colors.transparent.withOpacity(.05)),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const FoodText("Arriving in 8 minutes",
                      fontSize: 16,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  const Spacer(),
                  SizedBox(
                    height: 20,
                    child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const FoodText(
                          'Picked',
                          color: kcred,
                        )),
                  ),
                ],
              ),
              const Divider(
                color: kcgrey5,
              ),
              Row(
                children: [
                  const FoodText("Food | S&L Diner",
                      fontSize: 14,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  const Spacer(),
                  SizedBox(
                    width: 20,
                    child: MyICondeButton(
                      onPressed: () {
                        RouteX.fadeIn(context, const TrackOrder());
                      },
                      icon: const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: kcBlack,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FoodText("\$150 - 1 item - Cash",
                      fontSize: 14,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  FoodText("Michael - 0356634221",
                      fontSize: 14,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          FoodText("John Nguyen ",
                              fontSize: 14,
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          FoodText("(Driver)",
                              fontSize: 13.5,
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const FoodText(" is heading to you",
                          fontSize: 14,
                          style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const CircleAvatar(
                      radius: 18,
                      foregroundColor: kcwhite,
                      child: Icon(MyFlutterApp.call),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      RouteX.fadeIn(context, const MessageScreen());
                    },
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        RouteX.fadeIn(context, const MessageScreen());
                      },
                      icon: const CircleAvatar(
                        radius: 18,
                        foregroundColor: kcwhite,
                        child: RotatedBox(
                            quarterTurns: -4,
                            child: Icon(MyFlutterApp.chat, size: 20)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

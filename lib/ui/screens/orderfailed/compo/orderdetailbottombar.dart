import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/driverreviewdialouge/driverreviewdialouge.dart';
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';

class OrdeDetailBottomBar extends StatelessWidget {
  const OrdeDetailBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: kpaddinghor17,
        child: Row(
          children: [
            Expanded(
              child: MasterButton(
                name: "Rate-us",
                onTap: () async {
                  var result = await showDialog(
                      context: context,
                      builder: (context) => DriverReviewDialogue());
                  if (result == true) {
                    RouteX.sliderRighToLeft(context, const MainHome());
                  }
                },
                isOutlined: true,
              ),
            ),
            ksh12,
            Expanded(
              child: MasterButton(
                name: "Re-Order",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:frontend/Helpers/mlib.dart';

class Detailsmyorder3 extends StatefulWidget {
  const Detailsmyorder3({
    Key? key,
    required this.totalitemcount,
  }) : super(key: key);
  final int totalitemcount;

  @override
  State<Detailsmyorder3> createState() => _Detailsmyorder3State();
}

class _Detailsmyorder3State extends State<Detailsmyorder3> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
            color: kcwhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        height: 475,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
          child: Scaffold(
            body: Padding(
              padding: kpadding,
              child: Column(
                children: [
                  ksv20,
                  Image.asset(
                    "asset/images/dialouge/group_2.png",
                    scale: 3,
                  ),
                  const Spacer(),
                  const FoodText(
                    "Thank you\nfor your order",
                    fonsize: 26,
                  ),
                  ksv16,
                  const FoodText(
                    "Rate us so that we can\n improve our service",
                    color: kctxtcolor,
                    fonsize: 16,
                  ),
                  const Spacer(),
                  MasterButton(name: "Rate us", onTap: () {}),

                  ///
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const FoodText("Maybe next time")),
                  ksv12,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

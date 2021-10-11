import 'package:frontend/Helpers/mlib.dart';

class DetailsInformationWidget extends StatelessWidget {
  const DetailsInformationWidget({
    Key? key,
    required this.shadowVisibility,
  }) : super(key: key);
  final bool shadowVisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
        // duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(shadowVisibility ? 15 : 0),
            color: kcwhite,
            boxShadow: [
              shadowVisibility
                  ? BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(2, 5),
                      color: Colors.transparent.withOpacity(.05))
                  : const BoxShadow(),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "S&L fox",
              style: TextStyle(
                color: Color(0xff0B2E40),
                fontSize: 20,
                fontFamily: "Avenir",
              ),
            ),
            const Text(
              "189 Avenue Street, Edinbugh",
              style: TextStyle(color: Color(0xff7E7B7B)),
            ),
            const Divider(
              color: kcgrey5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IConedText(
                    data: MyFlutterApp.star,
                    name: "4.9(284)",
                    color: Colors.amber),
                IConedText(
                    data: MyFlutterApp.alaram,
                    name: "10-15 min",
                    color: Color(0xff244495)),
                IConedText(
                    data: MyFlutterApp.map,
                    name: "Free",
                    color: Color(0xff244495)),
              ],
            )
          ],
        ));
  }
}

class IConedText extends StatelessWidget {
  const IConedText(
      {Key? key, required this.data, required this.name, required this.color})
      : super(key: key);
  final IconData data;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            data,
            size: 16,
            color: color,
          ),
          const SizedBox(
            width: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(name, style: const TextStyle(color: Color(0xff244495))),
          )
        ],
      ),
    );
  }
}

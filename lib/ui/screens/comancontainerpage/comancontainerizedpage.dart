import 'package:frontend/Helpers/mlib.dart';

class ComanContaineraziedPag extends StatelessWidget {
  const ComanContaineraziedPag({
    Key? key,
    required this.children,
    required this.appbarTitel,
    this.alignment = CrossAxisAlignment.start,
    this.topchild = const SizedBox(),
  }) : super(key: key);

  final List<Widget> children;
  final String appbarTitel;
  final CrossAxisAlignment? alignment;
  final Widget? topchild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: newMethod(context),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 26, bottom: 0),
            child: topchild!,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 26, bottom: 30),
            decoration: BoxDecoration(
              color: kcwhite,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Column(
              crossAxisAlignment: alignment!,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  AppBar newMethod(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: MyICondeButton(
          icon: const Icon(MyFlutterApp.arrowback, color: kcblack),
          onPressed: () {
            Navigator.pop(context);
          }),
      backgroundColor: kcwhite,
      title: FoodText.ktsAnreg(
        appbarTitel,
        fontSize: 18,
      ),
    );
  }
}

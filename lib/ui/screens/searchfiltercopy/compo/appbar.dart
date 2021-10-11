import 'package:frontend/Helpers/mlib.dart';

AppBar searchFilterCopyAppBar(BuildContext context, VoidCallback ontap) {
  return AppBar(
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: kcwhite,
    leading: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          MyFlutterApp.arrowback,
          color: kcblack,
        ),
      ),
    ),
    actions: [
      SizedBox(
        width: 35,
        height: 30,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: ontap,
          child: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              MyFlutterApp.lines3,
              color: kclighblack,
              size: 30,
            ),
          ),
        ),
      ),
      SizedBox(width: 20)
    ],
    leadingWidth: 50,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 48,
        child: TxtField(
          filledColor: kcgrey3,
          hint: "Find Adress",
          hintstyle: const TextStyle(color: kcgrey4),
          prefix: const Icon(
            MyFlutterApp.search,
            color: kcgrey5,
          ),
        ),
      ),
    ),
  );
}

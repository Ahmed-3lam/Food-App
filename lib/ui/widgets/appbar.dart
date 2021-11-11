import 'package:frontend/Helpers/mlib.dart';

commonAppBar(BuildContext context, String name, {PreferredSize? bottom}) {
  return AppBar(
    toolbarHeight: 50,
    backgroundColor: kcwhite,
    elevation: 0,
    leadingWidth: 50,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FoodText(name,
          color: kcblack,
          fontSize: 20,
          style: const TextStyle(fontWeight: FontWeight.w400)),
    ),
    centerTitle: false,
    leading: Padding(
      padding: const EdgeInsets.only(top: 10, left: 5),
      child: MyICondeButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          MyFlutterApp.arrowback,
          color: kcblack,
        ),
      ),
    ),
    bottom: bottom,
  );
}

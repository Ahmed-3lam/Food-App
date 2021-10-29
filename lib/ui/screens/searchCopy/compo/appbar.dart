import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';

AppBar searchCopyAppbar(BuildContext context,
    {TextEditingController? controller}) {
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
    leadingWidth: 50,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 48,
        child: TxtField(
          controller: controller,
          filledColor: kcgrey3,
          hint: "Bubble Tea",
          hintstyle: const TextStyle(color: kcblack),
          prefix: Container(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                'asset/images/payments/2.svg',
                color: kcblack,
              )),
        ),
      ),
    ),
  );
}

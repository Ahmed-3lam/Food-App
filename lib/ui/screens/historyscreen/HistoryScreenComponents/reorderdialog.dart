import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Dialogs/commondialog.dart';
import 'package:frontend/ui/screens/orderdetails2/confirmorder.dart';

class ReOrderDialog extends StatelessWidget {
  const ReOrderDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kcTransparent,
      child: CommonDialog(
          tittle: 'Reorder',
          subTittle:
              'On tap reorder your order will place and then you can track your order and contact driver',
          buttonText: 'Reorder',
          dialogThemeColor: const Color(0xff22A45D),
          avatarChild: const Icon(
            Icons.done,
            color: kcwhite,
          ),
          onTap: () {
            Navigator.pop(context);

            RouteX.sliderRighToLeft(context, const ConfirmOrder());
          }),
    );
  }
}

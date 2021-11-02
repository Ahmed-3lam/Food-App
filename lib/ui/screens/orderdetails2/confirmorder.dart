import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/detailsmyorder3/detailsmyorder3.dart';
import 'package:frontend/ui/widgets/appbar.dart';

import './compo/ordedetailcounttile.dart';
import './compo/ordedetailtotalsubtotaltext.dart';
import './compo/orderdetailadress.dart';
import './compo/paymentmethod.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  customSlidePopUp(BuildContext context, Widget page) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder:
                (context, Animation<double> _ami1, Animation<double> _anim2) =>
                    SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(0, .5),
                              end: const Offset(0, 0))
                          .animate(CurvedAnimation(
                              parent: _ami1, curve: Curves.decelerate)),
                      child: page,
                    ),
            opaque: false,
            barrierDismissible: true,
            barrierColor: Colors.black54));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: kpaddinghor17,
          child: Row(
            children: [
              Expanded(
                child: MasterButton(
                  name: "Submit - \$150",
                  onTap: () {
                    customSlidePopUp(
                        context,
                        const Detailsmyorder3(
                          totalitemcount: 1,
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: comanAppBar(context, "Confirm Order"),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ksv30,
            OrderDetailsAdressTile(),
            ksv30,
            Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            ksv8,
            OrderDetailsOrderCountTile(),
            ksv10,
            Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            PromoTIle(),
            ksv8,
            Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            PaymentMethod(),
            Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            OrdeDetailsTotalSubtotal(),
          ],
        ),
      ),
    );
  }
}

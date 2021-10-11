import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/widgets/appbar.dart';

import './compo/orderdetailbottombar.dart';
import './compo/ordedetailcounttile.dart';
import './compo/ordedetailtotalsubtotaltext.dart';
import './compo/orderdetailadress.dart';
import './compo/paymentmethod.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const OrdeDetailBottomBar(),
      appBar: comanAppBar(context, "Confirm Order"),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ksv16,
            ksv12,
            OrderDetailsAdressTile(),
            ksv30,
            Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
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

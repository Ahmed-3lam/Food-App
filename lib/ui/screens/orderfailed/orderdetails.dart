import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/widgets/appbar.dart';

import './compo/ordedetailcounttile.dart';
import './compo/ordedetailtotalsubtotaltext.dart';
import './compo/orderdetailadress.dart';
import './compo/paymentmethod.dart';
import 'compo/orderdetailbottombar.dart';

class OrderFailed extends StatelessWidget {
  const OrderFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const OrdeDetailBottomBar(),
      appBar: comanAppBar(context, "Order Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ksv16,
            Padding(
              padding: kpaddinghor17,
              child: Row(
                children: const [
                  FoodText.ktsAnsemi(
                    "Order Failed",
                    fonsize: 16,
                    color: kcred,
                  ),
                  Spacer(),
                  FoodText(
                    "Reason: The driver canceled this",
                    fonsize: 13,
                  )
                ],
              ),
            ),
            ksv20,
            const Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            ksv12,
            const OrderDetailsAdressTile(),
            ksv30,
            const Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            ksv8,
            const OrderDetailsOrderCountTile(),
            ksv10,
            const Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            const PaymentMethod(),
            const Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
            const OrdeDetailsTotalSubtotal(),
            const Divider(
              height: 1,
              thickness: 6,
              color: kcdivider,
            ),
          ],
        ),
      ),
    );
  }
}

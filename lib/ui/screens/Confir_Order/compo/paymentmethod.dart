import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/checkoutscreen/checkout.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 112,
        child: Padding(
          padding: kpaddinghor17,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksv16,
              Row(
                children: [
                  const FoodText.ktsAnsemi(
                    "Payment Method",
                    fontSize: 16,
                  ),
                  const Spacer(),
                  SizedBox(
                      width: 60,
                      height: 25,
                      child: MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            RouteX.fadeIn(context, const CheckOutPayment());
                          },
                          child:
                              const FoodText.ktsAnsemi("Change", color: kcred)))
                ],
              ),
              ksv10,
              Row(
                children: [
                  Image.asset(
                    "asset/images/payments/viscard.png",
                    scale: 5,
                  ),
                  ksh30,
                  const FoodText("**** **** **** 9314")
                ],
              )
            ],
          ),
        ));
  }
}

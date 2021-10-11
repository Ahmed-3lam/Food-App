import 'package:frontend/Helpers/mlib.dart';

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
              const FoodText.ktsAnsemi(
                "Payment Method",
                fonsize: 16,
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

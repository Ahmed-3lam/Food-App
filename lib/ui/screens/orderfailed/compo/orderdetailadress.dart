import 'package:frontend/Helpers/mlib.dart';

class OrderDetailsAdressTile extends StatelessWidget {
  const OrderDetailsAdressTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kpaddinghor17,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const FoodText.ktsAnreg(
              "Deliver to",
              fonsize: 20,
            ),
            const Spacer(),
            SizedBox(
              width: 30,
              child: MyICondeButton(
                  icon: const FoodText(
                    "Edit",
                    color: kcred,
                  ),
                  onPressed: () {}),
            )
          ],
        ),
        ksv12,
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              SizedBox(
                  height: 88,
                  width: 88,
                  child: Image.asset(
                    "asset/images/home/smallbitmap.png",
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FoodText.ktsAnreg(
                    "Michel Clerk - 035264564",
                    fonsize: 16,
                  ),
                  FoodText.ktsAnreg(
                    "123 Avenue street",
                    fonsize: 14,
                  ),
                  FoodText.ktsAnreg("Add details", fonsize: 12),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

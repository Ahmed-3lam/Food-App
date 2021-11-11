import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/MainAdress/locationadress/locationadress.dart';
import 'package:frontend/ui/screens/MainAdress/mainadress.dart';

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
              fontSize: 20,
            ),
            const Spacer(),
            SizedBox(
              width: 30,
              child: MyICondeButton(
                  icon: const FoodText(
                    "Edit",
                    color: kcred,
                  ),
                  onPressed: () {
                    RouteX.fadeIn(context, const MainAdress());
                  }),
            )
          ],
        ),
        ksv12,
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    RouteX.fadeIn(context, const LocationAddress());
                  },
                  child: SizedBox(
                      height: 88,
                      width: 88,
                      child: Image.asset(
                        'asset/images/PlaceHolder/placeholder.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FoodText.ktsAnreg(
                    "Michel Clerk - 035264564",
                    fontSize: 16,
                  ),
                  FoodText.ktsAnreg(
                    "123 Avenue street",
                    fontSize: 14,
                  ),
                  FoodText.ktsAnreg("Add details", fontSize: 12),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

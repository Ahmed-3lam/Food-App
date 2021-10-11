import 'package:frontend/Helpers/mlib.dart';

class DetailsInfoPage extends StatelessWidget {
  const DetailsInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: kpadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Image.asset("asset/images/home/clipped.png"),
            const SizedBox(
              height: 24,
            ),
            const FoodText.ktsAnreg(
              "American Restaurant - Dinner",
              fonsize: 16,
            ),
            const FoodText.ktsAnreg(
              "Address: 189 Avenue street",
              fonsize: 16,
            ),
            const FoodText.ktsAnreg(
              "Phone: 012 15685646",
              fonsize: 16,
            ),
            const FoodText.ktsAnreg(
              "Daily from 10AM - 10.30PM",
              fonsize: 16,
            ),
          ],
        ),
      ),
    );
  }
}

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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'asset/images/PlaceHolder/placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 24,
            ),
            const FoodText.ktsAnreg(
              "American Restaurant - Dinner",
              fontSize: 16,
            ),
            const FoodText.ktsAnreg(
              "Address: 189 Avenue street",
              fontSize: 16,
            ),
            const FoodText.ktsAnreg(
              "Phone: 012 15685646",
              fontSize: 16,
            ),
            const FoodText.ktsAnreg(
              "Daily from 10AM - 10.30PM",
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}

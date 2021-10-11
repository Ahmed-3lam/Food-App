import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/repositary/resturantrepo.dart';
import 'package:frontend/ui/screens/homemasterhome/compo/yourrecentwidget.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: kpadding,
                  child: const FoodText.ktsAnreg(
                    "Latest",
                    fonsize: 22,
                  ),
                ),
                ksv10,
                ...List<FoodTile>.generate(
                    3,
                    (index) => FoodTile(
                        image: resturant[index].image,
                        name: resturant[index].name,
                        adress: resturant[index].adress,
                        startRating: resturant[index].startRating,
                        discount: resturant[index].discount,
                        time: resturant[index].time,
                        distance: resturant[index].distance,
                        revieCount: resturant[index].revieCount)).toList(),
                Padding(
                  padding: kpaddinghor20,
                  child: Row(
                    children: [
                      const FoodText.ktsAnreg(
                        "You often order...",
                        fonsize: 22,
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: const FoodText.ktsAnreg(
                            "Show All",
                            color: kcred,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const HomeYourRecentVisiArea(),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

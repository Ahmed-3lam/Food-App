import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/resturantrepo.dart';
import 'package:frontend/ui/screens/details/details.dart';
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
                    "Recent",
                    fontSize: 22,
                  ),
                ),
                ksv16,
                ...List<Widget>.generate(
                    3,
                    (index) => GestureDetector(
                          onTap: () {
                            RouteX.fadeIn(context,
                                Details(image: resturant[index].image));
                          },
                          child: FoodTile(
                              image: 'asset/images/PlaceHolder/placeholder.jpg',
                              name: resturant[index].name,
                              adress: resturant[index].adress,
                              startRating: resturant[index].startRating,
                              discount: resturant[index].discount,
                              time: resturant[index].time,
                              distance: resturant[index].distance,
                              revieCount: resturant[index].revieCount),
                        )).toList(),
                Padding(
                  padding: kpaddinghor20,
                  child: Row(
                    children: [
                      const FoodText.ktsAnreg(
                        "You often order...",
                        fontSize: 22,
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

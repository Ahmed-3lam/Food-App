import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Details-choose_desert/details_choose_desert.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ksv16,
      const FoodText.ktsAnsemi(
        "Eat what makes you happy",
        fonsize: 16,
      ),
      ksv16,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HomeImageCategories(
            name: "Healthy",
            path: "asset/images/homecategories/healthy.jpg",
          ),
          HomeImageCategories(
            name: "Home Style",
            path: "asset/images/homecategories/home.png",
          ),
          HomeImageCategories(
            name: "Rolls",
            path: "asset/images/homecategories/Rolls.jpg",
          ),
          HomeImageCategories(
            name: "Thali",
            path: "asset/images/homecategories/x.png",
          ),
        ],
      ),
      const SizedBox(height: 15),
      ksv16,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HomeImageCategories(
            name: "Biryani",
            path: "asset/images/homecategories/Biryani.jpeg",
          ),
          HomeImageCategories(
            name: "Pizza",
            path: "asset/images/homecategories/pizza.jpg",
          ),
          HomeImageCategories(
            name: "Panner",
            path: "asset/images/homecategories/panner.png",
          ),
          HomeImageCategories(
            name: "Burger",
            path: "asset/images/homecategories/burg.png",
          ),
        ],
      ),
      ksv16,
      const Divider(
        color: kcdivider,
        thickness: 2,
      ),
    ]);
  }
}

class HomeImageCategories extends StatelessWidget {
  const HomeImageCategories({
    Key? key,
    required this.path,
    required this.name,
  }) : super(key: key);

  final String path, name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          RouteX.sliderRighToLeft(context, const DetailsChooseDesert());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: kcwhite,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.transparent.withOpacity(.35),
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                        blurRadius: 10),
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.5),
                  child: Image.asset(path)),
            ),
            ksv6,
            FoodText.ktsAnreg(
              name,
              color: Colors.black,
              weight: FontWeight.w500,
            )
          ],
        ));
  }
}

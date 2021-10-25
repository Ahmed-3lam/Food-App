import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/repositary/resturantrepo.dart';
import 'package:frontend/ui/widgets/childspacer.dart';
import 'package:frontend/ui/widgets/foodtile.dart';

class HomeTabBarView extends StatefulWidget {
  const HomeTabBarView({Key? key}) : super(key: key);

  @override
  _HomeTabBarViewState createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            TabBar(
                indicatorPadding: EdgeInsets.zero,
                isScrollable: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 03,
                labelColor: kcred,
                // indicator: const BoxDecoration(color: Colors.transparent),
                unselectedLabelColor: kcblack,
                labelStyle: ktsAvenirDemi.copyWith(fontSize: 14),
                unselectedLabelStyle: ktsAnreg.copyWith(color: kcgrey5),
                tabs: const [
                  Tab(
                    text: "Near You",
                  ),
                  Tab(text: "Newest"),
                  Tab(
                    text: "Best Rated",
                  ),
                  Tab(
                    text: "Trending",
                  )
                ]),
          ],
        ),
        SizedBox(
            height: 433,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(controller: _tabController, children: const [
              FoodTileTabPage(),
              FoodTileTabPage(),
              FoodTileTabPage(),
              FoodTileTabPage(),
            ]))
      ],
    );
  }
}

class FoodTileTabPage extends StatefulWidget {
  const FoodTileTabPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FoodTileTabPage> createState() => _FoodTileTabPageState();
}

class _FoodTileTabPageState extends State<FoodTileTabPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: childSpacer([
            ksh30,
            ...List<FoodTile>.generate(
                resturant.length,
                (index) => FoodTile(
                    image: resturant[index].image,
                    name: resturant[index].name,
                    adress: resturant[index].adress,
                    startRating: resturant[index].startRating,
                    discount: resturant[index].discount,
                    time: resturant[index].time,
                    distance: resturant[index].distance,
                    revieCount: resturant[index].revieCount)).toList(),
            const SizedBox(
              height: 50,
            )
          ], 30),
        ),
      ),
    );
  }
}

import 'package:frontend/Helpers/childspacer.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/repositary/resturantrepo.dart';

import 'package:frontend/ui/screens/Details-choose_desert/details_choose_desert.dart';
import 'package:frontend/ui/screens/HomeMasterHome/compo/yourrecentwidget.dart';
import 'package:frontend/ui/screens/Location-choose_city/locationchoosecity.dart';
import 'package:frontend/ui/screens/profile/profilescren.dart';

class Home2 extends StatefulWidget {
  const Home2({
    Key? key,
  }) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: kpaddinghor20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ksv20,
                    Row(children: [
                      SizedBox(
                        height: 35,
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            RouteX.sliderRighToLeft(
                                context, const LocationChooseCity());
                          },
                          child: Row(
                            children: const [
                              Icon(
                                MyFlutterApp.location,
                                color: kctxtcolor,
                              ),
                              ksh12,
                              FoodText.ktsAvenir(
                                "Zone II",
                                fonsize: 18,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            RouteX.sliderRighToLeft(
                                context, const ProfileScreen());
                          },
                          child: const Icon(
                            MyFlutterApp.bolduser,
                            color: kctxtcolor,
                          ),
                        ),
                      ),
                    ]),
                    ksv12,
                    const FoodText.ktsAnsemi("123 Avenue Street "),
                    const Divider(
                      color: kcdivider,
                      thickness: 2,
                    ),
                    ksv16,
                    TxtField(
                      hint: "Find your favourite one",
                      filledColor: kcgrey2,
                      prefix: const Icon(MyFlutterApp.search),
                    ),
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
                    const SizedBox(height: 15),
                    const Divider(
                      color: kcdivider,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                        physics: const PageScrollPhysics(),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: HomeServiceBanner(),
                            )),
                  ),
                ),
              ),
              Padding(
                padding: kpaddinghor20,
                child: Row(
                  children: [
                    const FoodText.ktsAnreg(
                      "Your recent visits",
                      fonsize: 22,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 90,
                      height: 30,
                      child: FlatButton(
                          padding: EdgeInsets.zero,
                          color: kcred.withOpacity(.25),
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: const FoodText.ktsAnreg(
                              "Show All",
                              color: kcred,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const HomeYourRecentVisiArea(),
              const SizedBox(
                height: 8,
              ),
              ////HERE WE ARE GOING TO ADD THE DIVIDER
              const SizedBox(
                height: 18,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(22)),
                    color: kclightpurpel.withOpacity(.08)),
                height: 483,
                child: const ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(22)),
                    child: HomeTabBarView()),
              ),
              // const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}

class HomeServiceBanner extends StatelessWidget {
  const HomeServiceBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            offset: const Offset(0, 5),
            color: kcTransparent.withOpacity(.25),
            blurRadius: 12,
            spreadRadius: 0),
      ]),
      height: 165,
      width: MediaQuery.of(context).size.width - 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "asset/images/home/banner.png",
          fit: BoxFit.cover,
        ),
      ),
    );
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
            SizedBox(
              height: 48,
              child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  isScrollable: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 01,
                  labelColor: kcred,
                  indicator: const BoxDecoration(color: Colors.transparent),
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
            ),
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
      height: 433,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: childSpacer([
            const SizedBox(
              height: 10,
            ),
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
              height: 0,
            )
          ], 0),
        ),
      ),
    );
  }
}

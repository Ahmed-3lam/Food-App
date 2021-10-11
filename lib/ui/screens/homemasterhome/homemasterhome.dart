import 'dart:async';

import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/repositary/resturantrepo.dart';

import 'package:frontend/services/my_flutter_app_icons.dart';
import 'package:frontend/ui/screens/details/details.dart';
import 'package:frontend/ui/screens/homemasterhome/compo/yourrecentwidget.dart';
import 'compo/header.dart';
import 'compo/homecarousel.dart';
import 'compo/homecategorytile.dart';
import 'compo/homeservicebanner.dart';

class HomeMasterHome extends StatefulWidget {
  const HomeMasterHome({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeMasterHome> createState() => _HomeMasterHomeState();
}

class _HomeMasterHomeState extends State<HomeMasterHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  Widget _buildcategories() {
    return Padding(
      padding: kpaddinghor20,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomeSelctCategorytile(
                  iconData: MyFlutterApp.zinga,
                  image: 'Seafood',
                ),
                HomeSelctCategorytile(
                  iconData: MyFlutterApp.pizaa,
                  image: 'American',
                ),
                HomeSelctCategorytile(
                  iconData: MyFlutterApp.burger,
                  image: 'Burger',
                ),
                HomeSelctCategorytile(
                  iconData: MyFlutterApp.desert,
                  image: 'Dessert',
                )
              ],
            ),
          ),
          ksv16,
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: kcdivider,
            thickness: 2,
          ),
        ],
      ),
    );
  }

  Widget _homeTop() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Container(
            height: 403,
            decoration: const BoxDecoration(
              color: kcred,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  50,
                ),
              ),
            ),
          ),
          Column(
            children: const [
              HomeHeader(),
              SizedBox(
                height: 20,
              ),
              HomeCarousel(),
            ],
          )
        ],
      ),
    );
  }

  Widget _banners() {
    List<String> image = [
      "asset/images/home/banner.png",
      'asset/images/home/homeoffers.png'
    ];
    return SizedBox(
      height: 200,
      child: Center(
        child: SizedBox(
          height: 200,
          child: PageView.builder(
            physics: const PageScrollPhysics(),
            itemCount: image.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(20),
              child: HomeServiceBanner(
                image: image[i],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _recentsearch() {
    return Padding(
      padding: kpaddinghor20,
      child: Row(
        children: [
          const FoodText.ktsAnreg(
            "Your recent visits",
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
    );
  }

  bool isLoading = false;

  _loadingHandeler() {
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverSafeArea(
          sliver: SliverList(
              delegate: SliverChildListDelegate(
            [
              _homeTop(),
              _buildcategories(),
              _banners(),
              _recentsearch(),
              ksv8,
              const HomeYourRecentVisiArea(),
              ksv24,
            ],
          )),
        ),
        SliverAppBar(
          toolbarHeight: 0,
          backgroundColor: kcwhite,
          pinned: true,
          bottom: PreferredSize(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TabBar(
                    onTap: (i) async {
                      isLoading = true;
                      setState(() {});
                      Timer(
                          const Duration(milliseconds: 700), _loadingHandeler);
                    },
                    indicatorPadding: EdgeInsets.zero,
                    isScrollable: true,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    controller: _tabcontroller,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 03,
                    labelColor: kcred,
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
              preferredSize: const Size.fromHeight(50)),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        isLoading
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height * .8,
                  width: size.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildListDelegate(List.generate(
                        resturant.length,
                        (index) => GestureDetector(
                            onTap: () {
                              RouteX.sliderRighToLeft(context, const Details());
                            },
                            child: FoodTile(
                                image: resturant[index].image,
                                name: resturant[index].name,
                                adress: resturant[index].adress,
                                startRating: resturant[index].startRating,
                                discount: resturant[index].discount,
                                time: resturant[index].time,
                                distance: resturant[index].distance,
                                revieCount: resturant[index].revieCount)))
                    .toList()))
      ]),
    );
  }
}

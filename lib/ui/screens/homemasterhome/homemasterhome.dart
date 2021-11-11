import 'dart:async';

///
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/resturantrepo.dart';

///
import 'package:frontend/ui/screens/details/details.dart';
import 'package:frontend/ui/screens/homemasterhome/compo/yourrecentwidget.dart';
import 'compo/carouseloffer.dart';
import 'compo/homecategorytile.dart';
import 'compo/hometop.dart';

class HomeMasterHome extends StatefulWidget {
  const HomeMasterHome({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeMasterHome> createState() => _HomeMasterHomeState();
}

class _HomeMasterHomeState extends State<HomeMasterHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  List<String> image = [
    'asset/images/PlaceHolder/placeholder.jpg',
    'asset/images/PlaceHolder/placeholder.jpg'
  ];

  Widget _recentSearch() {
    return Padding(
      padding: kpaddinghor20,
      child: Row(
        children: [
          const FoodText.ktsAnreg(
            "Your recent visits",
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
    );
  }

  bool isLoading = false;

  _loadingHandler() {
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(cacheExtent: 1000, slivers: [
        SliverList(
            delegate: SliverChildListDelegate(
          [
            const HomeTop(),
            const BuildCategories(),
            CarouselOfOffers(image: image),
            _recentSearch(),
            ksv8,
            const HomeYourRecentVisiArea(),
          ],
        )),
        SliverAppBar(
          // flexibleSpace: Placeholder(),

          toolbarHeight: 0.0,
          backgroundColor: kcwhite,
          pinned: true,
          floating: true,
          bottom: PreferredSize(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TabBar(
                    onTap: (i) async {
                      isLoading = true;
                      setState(() {});
                      Timer(const Duration(milliseconds: 700), _loadingHandler);
                    },
                    indicatorPadding: EdgeInsets.zero,
                    isScrollable: true,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    controller: _tabController,
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
                key: const ValueKey('value'),
                delegate: SliverChildListDelegate(List.generate(
                    resturant.length,
                    (index) => GestureDetector(
                        onTap: () {
                          RouteX.fadeIn(
                              context,
                              Details(
                                image:
                                    'asset/images/PlaceHolder/placeholder.jpg',
                              ));
                        },
                        child: FoodTile(
                            image: "asset/images/PlaceHolder/placeholder.jpg",
                            name: resturant[index].name,
                            adress: resturant[index].adress,
                            startRating: resturant[index].startRating,
                            discount: resturant[index].discount,
                            time: resturant[index].time,
                            distance: resturant[index].distance,
                            revieCount:
                                resturant[index].revieCount))).toList()))
      ]),
    );
  }
}

class BuildCategories extends StatelessWidget {
  const BuildCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 145,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 28,
            itemBuilder: (context, int index) => Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15, left: 18),
              child: HomeSelctCategorytile(
                iconData: 'asset/images/categoried/${index + 1}.svg',
                image: names[index],
              ),
            ),
          ),
        ),
        const Divider(
          color: kcdivider,
          thickness: 2,
        ),
      ],
    );
  }
}

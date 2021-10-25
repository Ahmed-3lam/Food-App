import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/resturantrepo.dart';

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

  List<String> image = [
    "asset/images/home/banner.png",
    'asset/images/home/homeoffers.png'
  ];

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
      body: CustomScrollView(cacheExtent: 1000, slivers: [
        SliverSafeArea(
          sliver: SliverList(
              delegate: SliverChildListDelegate(
            [
              const HomeTop(),
              const BuildCategories(),
              CarouselOfOffers(image: image),
              _recentsearch(),
              ksv8,
              const HomeYourRecentVisiArea(),
            ],
          )),
        ),
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
                key: const ValueKey('value'),
                delegate: SliverChildListDelegate(List.generate(
                        resturant.length,
                        (index) => GestureDetector(
                            onTap: () {
                              RouteX.sliderRighToLeft(
                                  context,
                                  Details(
                                    image: resturant[index].image,
                                  ));
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

class CarouselOfOffers extends StatelessWidget {
  const CarouselOfOffers({
    Key? key,
    required this.image,
  }) : super(key: key);

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselSlider.builder(
        itemCount: image.length,
        options:
            CarouselOptions(height: 200, autoPlay: true, viewportFraction: 1),
        itemBuilder: (context, i, i2) => Padding(
          padding: const EdgeInsets.all(20),
          child: HomeServiceBanner(
            image: image[i],
          ),
        ),
      ),
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

class HomeTop extends StatelessWidget {
  const HomeTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    ;
  }
}

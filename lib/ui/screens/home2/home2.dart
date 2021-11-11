import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/childspacer.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/resturantrepo.dart';
import 'package:frontend/ui/screens/details/details.dart';

import 'package:frontend/ui/screens/home2/home2compo/categorie.dart';
import 'package:frontend/ui/screens/home2/home2compo/yourrecentvisits.dart';
import 'package:frontend/ui/screens/searchCopy/searchcopy.dart';

import 'home2compo/homeadresszone.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  bool isLoading = false;

  _loadingHandeler() {
    isLoading = false;
    setState(() {});
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      cacheExtent: 1000,
      slivers: [
        const SliverSafeArea(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: HomeAdressZone(),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                RouteX.sliderRighToLeft(context, const SearchCopy());
              },
              child: SizedBox(
                child: AbsorbPointer(
                  child: TxtField(
                    hint: "Find your favourite one",
                    filledColor: kcgrey2,
                    prefix: Container(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        'asset/images/payments/2.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Categories(),
          ),
          CarouselOfOffers(image: image),
          const YourRecentVisits(),
        ])),
        const SliverToBoxAdapter(
          child: SizedBox(height: 0),
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
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width,
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
                          RouteX.sliderRighToLeft(
                              context, Details(image: resturant[index].image));
                        },
                        child: FoodTile(
                            image: resturant[index].image,
                            name: resturant[index].name,
                            adress: resturant[index].adress,
                            startRating: resturant[index].startRating,
                            discount: resturant[index].discount,
                            time: resturant[index].time,
                            distance: resturant[index].distance,
                            revieCount:
                                resturant[index].revieCount))).toList()))
      ],
    ));
  }
}

class HomeServiceBanner extends StatelessWidget {
  const HomeServiceBanner({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

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
          image,
          fit: BoxFit.cover,
        ),
      ),
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

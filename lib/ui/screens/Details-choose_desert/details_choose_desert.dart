import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/resturantrepo.dart';
import 'package:frontend/ui/screens/details/details.dart';

import 'package:frontend/ui/widgets/appbar.dart';

class DetailsChooseDesert extends StatefulWidget {
  const DetailsChooseDesert({Key? key}) : super(key: key);

  @override
  _DetailsChooseDesertState createState() => _DetailsChooseDesertState();
}

class _DetailsChooseDesertState extends State<DetailsChooseDesert>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: comanAppBar(
        context,
        "Desert",
        bottom: PreferredSize(
          child: SizedBox(
            height: 45,
            child: TabBar(
                indicatorPadding: EdgeInsets.zero,
                isScrollable: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelColor: kcred,
                unselectedLabelColor: kcblack,
                labelStyle: ktsAvenirDemi.copyWith(fontSize: 14),
                unselectedLabelStyle: ktsAnreg.copyWith(color: kctxtcolor),
                tabs: const [
                  Tab(
                    text: "Near You",
                  ),
                  Tab(
                    text: "Best Rated",
                  ),
                  Tab(
                    text: "Top Sales",
                  )
                ]),
          ),
          preferredSize: const Size.fromHeight(50),
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        DesertPage(
          numbes: 4,
        ),
        DesertPage(
          numbes: 5,
        ),
        DesertPage(
          numbes: 6,
        ),
      ]),
    );
  }
}

class DesertPage extends StatelessWidget {
  const DesertPage({Key? key, required this.numbes}) : super(key: key);
  final int numbes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ksv20,
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: numbes < 5 ? numbes : resturant.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
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
                        revieCount: resturant[index].revieCount));
              },
            ),
          ],
        ),
      ),
    );
  }
}

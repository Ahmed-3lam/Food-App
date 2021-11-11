import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Details-choose_desert/details_choose_desert.dart';
import 'package:frontend/ui/screens/searchfiltercopy/searchfiltercopy.dart';

class SearchITem extends StatefulWidget {
  const SearchITem({Key? key}) : super(key: key);

  @override
  _SearchITemState createState() => _SearchITemState();
}

class _SearchITemState extends State<SearchITem>
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
      appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: kcwhite,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                MyFlutterApp.arrowback,
                color: kcblack,
              ),
            ),
          ),
          leadingWidth: 50,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 48,
              child: TxtField(
                filledColor: kclightwhite,
                hint: "Find Item",
                hintstyle: const TextStyle(color: kcgrey5),
                prefix: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    MyFlutterApp.search,
                    color: kcgrey5,
                  ),
                ),
              ),
            ),
          ),
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
                  unselectedLabelStyle: const TextStyle(
                    color: kcgrey5,
                  ),
                  tabs: const [
                    Tab(
                      text: "Near you",
                    ),
                    Tab(
                      text: "Best Rated",
                    ),
                    Tab(
                      text: "Top Sales",
                    )
                  ]),
            ),
            preferredSize: const Size.fromHeight(48),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  RouteX.fadeIn(context, const SearchFilterCopy());
                },
                child: const Icon(
                  MyFlutterApp.lines3,
                  color: kclighblack,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 20)
          ]),
      body: TabBarView(controller: _tabController, children: const [
        DesertPage(
          numbes: 10,
        ),
        DesertPage(
          numbes: 10,
        ),
        DesertPage(
          numbes: 10,
        ),
      ]),
    );
  }
}

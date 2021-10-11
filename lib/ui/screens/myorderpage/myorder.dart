import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/main.dart';
import 'package:frontend/ui/screens/historyscreen/historyscreen.dart';
import 'package:frontend/ui/screens/myorderpage/compo/myordertrackingtile.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      labelColor: kcred,
                      unselectedLabelColor: kcblack,
                      labelStyle: ktsAnsemi.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      unselectedLabelStyle: ktsAnsemi.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kcgrey5,
                      ),
                      tabs: const [
                        Tab(text: "My Bookings"),
                        Tab(text: "Ongoing"),
                        Tab(text: "History"),
                      ]),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  const MyBooking(),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/images/home/bitmap.png"))),
                    child: GestureDetector(
                        onTap: () {}, child: const OrderTrackingTile()),
                  ),
                  const HistoryScreen(),
                ]),
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/main.dart';
import 'package:frontend/ui/screens/NewMap/newmap.dart';
import 'package:frontend/ui/screens/historyscreen/historyscreen.dart';
import 'package:frontend/ui/screens/mybooking/mybooking.dart';

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
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kcwhite,
            toolbarHeight: 0,
            bottom: TabBar(
                onTap: (i) {
                  setState(() {});
                },
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
                  Tab(text: "Booking"),
                  Tab(text: "Ongoing"),
                  Tab(text: "History"),
                ]),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MyBooking(),
              DemoMap(),
              HistoryScreen(),
            ],
            controller: _tabController,
          )),
    );
  }
}

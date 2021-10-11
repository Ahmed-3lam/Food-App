import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/details/deliverypage/detaildeliverypage.dart';
import 'package:frontend/ui/screens/details/reviewpage/detaildeliveryreviewpage.dart';
import 'package:frontend/ui/screens/details/compo/detailsinformationwidget.dart';

import 'deliverypage/compo/detaildeliverybottomappbar.dart';
import 'info/detailsinfopage.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _controller;
  int index = 0;
  bool toShowBar = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _controller = ScrollController()
      ..addListener(() {
        _showBottomBar();
      });

    super.initState();
  }

  _showBottomBar() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse &&
        index == 0 &&
        _controller.position.pixels > 360) {
      if (!toShowBar) {
        toShowBar = true;
        setState(() {});
      }
    } else {
      toShowBar = false;
      setState(() {});
    }
  }

  List<Widget> chill = <Widget>[
    const DetailsDeliveyPage(),
    const DetailReviewPage(),
    const DetailsInfoPage(),
  ];

  _buildAppBar() {
    return SliverAppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      toolbarHeight: 0,
      pinned: true,
      backgroundColor: kcwhite,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(49),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TabBar(
              onTap: (x) {
                index = x;
                toShowBar = false;
                setState(() {});
              },
              indicatorPadding: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              labelColor: kcred,
              unselectedLabelColor: kcgrey5,
              labelStyle: ktsAvenirDemi.copyWith(fontSize: 14),
              unselectedLabelStyle: const TextStyle(
                color: kcgrey5,
              ),
              tabs: const [
                Tab(
                  text: "Delivery",
                ),
                Tab(text: "Review"),
                Tab(
                  text: "Info",
                )
              ]),
        ),
      ),
    );
  }

  _buildHeaderImage() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 395,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 360,
              child: Image.asset("asset/images/home/path.png"),
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    onTapDown: (TapDownDetails details) {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        MyFlutterApp.arrowback,
                        color: kcwhite,
                        size: 25,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: kcwhite,
                    child: Icon(
                      MyFlutterApp.search,
                      color: kcgrey5,
                    ),
                  ),
                  ksh12,
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: kcwhite,
                    child: Icon(
                      MyFlutterApp.love,
                      color: kcgrey5,
                      size: 20,
                    ),
                  ),
                  ksh12
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      padding: EdgeInsets.only(
                        bottom: 0,
                        left: _controller.position.pixels < 360
                            ? 30 -
                                30 *
                                    ((_controller.position.pixels /
                                            MediaQuery.of(context).size.height)
                                        .clamp(0, 1))
                            : 0,
                        right: _controller.position.pixels < 360
                            ? 30 -
                                30 *
                                    ((_controller.position.pixels /
                                            MediaQuery.of(context).size.height)
                                        .clamp(0, 1))
                            : 0,
                      ),
                      alignment: Alignment.bottomCenter,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: DetailsInformationWidget(
                        shadowVisibility: _controller.position.pixels < 360,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SafeArea(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  _buildHeaderImage(),
                  _buildAppBar(),
                  SliverToBoxAdapter(
                    child: IndexedStack(
                      children: chill,
                      index: index,
                    ),
                  )
                ],
              ),
            ),
            AnimatedContainer(
                height: toShowBar ? 60 : 0,
                duration: const Duration(milliseconds: 200),
                child: Wrap(
                  children: const [
                    DetailDeliveryBottomAppbar(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

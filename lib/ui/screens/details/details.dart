import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/details/deliverypage/detaildeliverypage.dart';
import 'package:frontend/ui/screens/details/detailmodel.dart';
import 'package:frontend/ui/screens/details/reviewpage/detaildeliveryreviewpage.dart';
import 'package:frontend/ui/screens/details/compo/detailsinformationwidget.dart';
import 'package:frontend/ui/utils/icons.dart';
import 'package:provider/provider.dart';

import 'deliverypage/compo/detaildeliverybottomappbar.dart';
import 'info/detailsinfopage.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _controller;
  int index = 0;
  // bool toShowBar = false;

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(widget.image), context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _controller = ScrollController()
      ..addListener(() {
        // _showBottomBar();
      });

    super.initState();
  }

  ///To MANAGE APPERANCE OF BOTTOM APPBAR ON SCROLLING
  // _showBottomBar() {
  //   if (index == 0 && _controller.position.pixels > 360) {
  //     if (!toShowBar) {
  //       toShowBar = true;
  //       setState(() {});
  //     }
  //   } else {
  //     toShowBar = false;
  //     setState(() {});
  //   }
  // }

  _buildAppBar() {
    return SliverAppBar(
      key: const ValueKey("value"),
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
                _controller.animateTo(_controller.position.minScrollExtent,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.decelerate);
                index = x;

                /// toShowBar = false;
                /// toScrollInThirdPage = true;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      lazy: true,
      builder: (context, child) => child!,
      create: (BuildContext context) => DetailsModel(),
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SafeArea(
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: _controller,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 395,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 360,
                              width: MediaQuery.of(context).size.width,
                              child: Hero(
                                tag: widget.image,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(35)),
                                  child: Image.asset(
                                    widget.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
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
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: kcwhite,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        'asset/images/payments/2.svg',
                                        color: kcBlack,
                                      ),
                                    ),
                                  ),
                                  ksh12,
                                  const CircleAvatar(
                                    radius: 18,
                                    backgroundColor: kcwhite,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        MyIcons.saved,
                                        color: kcBlack,
                                        size: 20,
                                      ),
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
                                                    ((_controller.position
                                                                .pixels /
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height)
                                                        .clamp(0, 1))
                                            : 0,
                                        right: _controller.position.pixels < 360
                                            ? 30 -
                                                30 *
                                                    ((_controller.position
                                                                .pixels /
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height)
                                                        .clamp(0, 1))
                                            : 0,
                                      ),
                                      alignment: Alignment.bottomCenter,
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.transparent,
                                      child: DetailsInformationWidget(
                                        shadowVisibility:
                                            _controller.position.pixels < 360,
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    _buildAppBar(),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: index == 2 ? 395 : null,
                        child: IndexedStack(
                          children: const [
                            DetailsDeliveyPage(),
                            DetailReviewPage(),
                            DetailsInfoPage()
                          ],
                          index: index,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<DetailsModel>(
                  builder: (BuildContext context, model, Widget? child) {
                return AnimatedContainer(
                    height: model.getProduct.isNotEmpty ? 60 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Wrap(
                      children: [
                        DetailDeliveryBottomAppbar(
                          totalItemCount: model.value,
                        ),
                      ],
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

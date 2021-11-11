import 'package:frontend/Helpers/mlib.dart';
//
import 'package:frontend/ui/screens/details/deliverypage/detaildeliverypage.dart';
import 'package:frontend/ui/screens/details/reviewpage/detaildeliveryreviewpage.dart';
//
import 'package:frontend/ui/screens/details/detailmodel.dart';
//
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/searchfiltercopy/searchfiltercopy.dart';
import 'package:frontend/ui/utils/icons.dart';
//
import 'package:like_button/like_button.dart';
import 'package:frontend/customepackge/lazyindexedstack.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
//
import 'deliverypage/compo/detaildeliverybottomappbar.dart';
import 'package:frontend/ui/screens/details/compo/detailsinformationwidget.dart';
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

  @override
  void didChangeDependencies() {
    ///WE CAN ALSO PROVIDE OTHER OBJECTS LIKE NETWORK IMAGE...
    precacheImage(AssetImage(widget.image), context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _controller = ScrollController();
    super.initState();
  }

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

  double symmetricStretcher() {
    ///HERE 360 IS SIZE OF THE IMAGE AND 30 IS BASE PADDING AND WE ARE REMOVING
    ///THE PADDING ON THE BASIS OF THE SCROLL OFFSET...
    return _controller.position.pixels < 360
        ? 30 -
            30 *
                ((_controller.position.pixels /
                        MediaQuery.of(context).size.height)
                    .clamp(0, 1))
        : 0;
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
                            SizedBox(
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

                            ///THIS PORTION IS APP BAR LOCATED AT THE TOP...
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
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
                                    SizedBox(
                                      height: 39,
                                      width: 39,
                                      child: GestureDetector(
                                        onTap: () {
                                          RouteX.sliderRighToLeft(context,
                                              const SearchFilterCopy());
                                        },
                                        child: CircleAvatar(
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
                                      ),
                                    ),
                                    ksh12,
                                    SizedBox(
                                      height: 39,
                                      width: 39,
                                      child: LikeButton(
                                        size: 36,
                                        likeBuilder: (bool b) => CircleAvatar(
                                          radius: 18,
                                          backgroundColor: !b ? kcwhite : kcred,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 3.0),
                                            child: Icon(
                                              MyIcons.saved,
                                              color: !b ? kcBlack : kcwhite,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ksh12
                                  ],
                                ),
                              ),
                            ),

                            ///THIS IS RESTAURANT INFORMATION TILE....
                            Positioned(
                              bottom: 0,
                              child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                        bottom: 0,
                                        left: symmetricStretcher(),
                                        right: symmetricStretcher(),
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

                    ///THIS IS STICKY HEADER ...
                    _buildAppBar(),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: index == 2 ? 395 : null,
                        child: LazyIndexedStack(
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
              const DetailDeliveryBottomAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}

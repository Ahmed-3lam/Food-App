import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/customepackge/lazyindexedstack.dart';
import 'package:frontend/ui/screens/Dialogs/commondialog.dart';
import 'package:frontend/ui/screens/User_controll/profile/profilescren.dart';
import 'package:frontend/ui/screens/home2/home2.dart';
import 'package:frontend/ui/screens/homemasterhome/homemasterhome.dart';
import 'package:frontend/ui/screens/myorderpage/myorder.dart';
import 'package:frontend/ui/screens/savedpage/savedpage.dart';
import 'package:frontend/ui/utils/icons.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  late OverlayEntry _entry;

  ///WE ARE CRATING THIS SPINNER FOR THE FUTURE WHEN WE ARE FETCHING THE DATA
  ///IT MAY INDICATE...
  OverlayEntry initialSpinner() {
    return OverlayEntry(
        builder: (context) => Positioned(
            height: 60,
            width: 60,
            top: MediaQuery.of(context).size.height / 2 - 30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Material(
              color: kcwhite,
              elevation: 10,
              borderRadius: BorderRadius.circular(30),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  color: kcred,
                ),
              ),
            )));
  }

  ///THIS DATA IS FOR FANCY_BOTTOM_NAVIGATION BAR IN BOTTOM...
  List<TabData> data = [
    TabData(
      iconData: MyIcons.home,
      title: "Home",
    ),
    TabData(
      iconData: MyIcons.myOrder,
      title: "Order",
    ),
    TabData(
      iconData: MyIcons.saved,
      title: "Saved",
    ),
    TabData(
      iconData: MyIcons.profile,
      title: "User",
    ),
  ];

  ///THIS FUNCTION WORKS AS SETTING UP OF SPINNER..
  entrySetter() async {
    _entry = initialSpinner();
    Overlay.of(context)?.insert(_entry);
    await Future.delayed(const Duration(seconds: 1));
    _entry.remove();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      entrySetter();
    });
  }

  GlobalKey<FancyBottomNavigationState> key =
      GlobalKey<FancyBottomNavigationState>();

  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var v = await showDialog<bool?>(
            context: context,
            builder: (context) => Dialog(
                  backgroundColor: kcTransparent,
                  child: CommonDialog(
                      tittle: 'Are you sure?',
                      subTittle: 'On tap Quit application will closed',
                      buttonText: 'Quit',
                      dialogThemeColor: kcred,
                      avatarChild: const Icon(Icons.close),
                      onTap: () {
                        Navigator.pop(context, true);
                      }),
                ));
        return v ?? false;
      },
      child: Scaffold(
        body: LazyIndexedStack(
          children: const [
            HomeMasterHome(),
            MyOrderPage(),
            SavedPage(),
            ProfileScreen(),
          ],
          index: tabIndex,
        ),
        bottomNavigationBar: FancyBottomNavigation(
            key: key,
            style: ktsAnsemi,
            circleColor: kcred,
            tabs: data,
            onTabChangedListener: (i) {
              tabIndex = i;
              setState(() {});
            }),
      ),
    );
  }
}

///HOME OPTION 2 FOR THE HOME

class CloneHome extends StatefulWidget {
  const CloneHome({Key? key}) : super(key: key);

  @override
  _CloneHomeState createState() => _CloneHomeState();
}

class _CloneHomeState extends State<CloneHome>
    with SingleTickerProviderStateMixin {
  List<TabData> data = [
    TabData(
      iconData: MyIcons.home,
      title: "Home",
    ),
    TabData(
      iconData: MyIcons.myOrder,
      title: "Order",
    ),
    TabData(
      iconData: MyIcons.saved,
      title: "Saved",
    ),
    TabData(
      iconData: MyIcons.profile,
      title: "User",
    ),
  ];

  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyIndexedStack(
        children: const [
          Home2(),
          MyOrderPage(),
          SavedPage(),
          ProfileScreen(),
        ],
        index: tabIndex,
      ),
      bottomNavigationBar: FancyBottomNavigation(
          style: ktsAnsemi.copyWith(color: kcred, fontWeight: FontWeight.w600),
          circleColor: kcred,
          tabs: data,
          onTabChangedListener: (i) {
            tabIndex = i;
            setState(() {});
          }),
    );
  }
}

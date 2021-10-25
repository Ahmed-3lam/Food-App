import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/home2/home2.dart';
import 'package:frontend/ui/screens/homemasterhome/homemasterhome.dart';
import 'package:frontend/ui/screens/myorderpage/myorder.dart';
import 'package:frontend/ui/screens/profile/profilescren.dart';
import 'package:frontend/ui/screens/savedpage/savedpage.dart';
import 'package:frontend/ui/utils/icons.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late OverlayEntry _entry;

  OverlayEntry initalLoad() {
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

  entrySetter() async {
    _entry = initalLoad();
    Overlay.of(context)?.insert(_entry);
    await Future.delayed(const Duration(seconds: 4));
    _entry.remove();
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this)..addListener(() {});
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      entrySetter();
    });
  }

  List<Widget> _buildPages() {
    return [
      const HomeMasterHome(),
      const MyOrderPage(),
      const SavedPage(),
      const ProfileScreen(),
    ];
  }

  int tabIndex = 0;
  List<Widget> _buildTabs() {
    return [
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.home),
        text: "Home",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.myOrder),
        text: "Order",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.saved),
        text: "Saved",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.profile),
        text: "User",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: TabBar(
          indicatorColor: kcTransparent,
          labelColor: kcred,
          unselectedLabelColor: kcicon,
          tabs: _buildTabs(),
          controller: _controller,
          onTap: (i) {
            tabIndex = i;
            setState(() {});
          },
        ),
      ),
      body: IndexedStack(
        children: _buildPages(),
        index: tabIndex,
      ),
    );
  }
}

class CloneHome extends StatefulWidget {
  const CloneHome({Key? key}) : super(key: key);

  @override
  State<CloneHome> createState() => _CloneHomeState();
}

class _CloneHomeState extends State<CloneHome>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this)..addListener(() {});
  }

  List<Widget> _buildPages() {
    return [
      const Home2(),
      const MyOrderPage(),
      const SavedPage(),
      const ProfileScreen(),
    ];
  }

  int tabIndex = 0;
  List<Widget> _buildTabs() {
    return [
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.home),
        text: "Home",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.myOrder),
        text: "Order",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.saved),
        text: "Saved",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyIcons.profile),
        text: "User",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: TabBar(
          indicatorColor: kcTransparent,
          labelColor: kcred,
          unselectedLabelColor: kcicon,
          tabs: _buildTabs(),
          controller: _controller,
          onTap: (i) {
            tabIndex = i;
            setState(() {});
          },
        ),
      ),
      body: IndexedStack(
        children: _buildPages(),
        index: tabIndex,
      ),
    );
  }
}

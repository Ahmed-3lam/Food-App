import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/homemasterhome/homemasterhome.dart';
import 'package:frontend/ui/screens/myorderpage/myorder.dart';
import 'package:frontend/ui/screens/profile/profilescren.dart';
import 'package:frontend/ui/screens/savedpage/savedpage.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this)..addListener(() {});
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
        icon: Icon(MyFlutterApp.home),
        text: "Home",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyFlutterApp.listpad),
        text: "Order",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyFlutterApp.love),
        text: "Saved",
      ),
      const Tab(
        iconMargin: EdgeInsets.only(bottom: 5),
        icon: Icon(MyFlutterApp.user),
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

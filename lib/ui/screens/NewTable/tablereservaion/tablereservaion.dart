import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/NewTable/confirmpopup/confirmpopup.dart';
import 'package:frontend/ui/screens/NewTable/tablereservaion/tablecomponents/timegrid.dart';
import 'package:intl/intl.dart';

import 'tablecomponents/guestcount.dart';

class DayAndNumber {
  DayAndNumber({
    required this.day,
    required this.dayWithMonth,
    required this.index,
  });
  String day, dayWithMonth;
  int index;
}

class ReserveTable extends StatefulWidget {
  const ReserveTable({Key? key}) : super(key: key);

  @override
  State<ReserveTable> createState() => _ReserveTableState();
}

class _ReserveTableState extends State<ReserveTable>
    with SingleTickerProviderStateMixin {
  late DateTime _time;
  late String _format;
  late List _sevenDaysFromNow;
  late List<DayAndNumber> _formatedDays;
  late TabController _controller;
  late TabController _anotherController;

  fillTheDates() {
    _time = DateTime.now();
    _format = DateFormat('dd/MM').format(_time);
    _sevenDaysFromNow = [];
    _formatedDays = [];
    for (var i = 0; i < 7; i++) {
      _sevenDaysFromNow.add(_time.add(Duration(days: i)));
    }
    for (DateTime time in _sevenDaysFromNow) {
      _formatedDays.add(DayAndNumber(
          index: _formatedDays.length,
          day: DateFormat('dd/MM').format(time),
          dayWithMonth: DateFormat('EEEE').format(time).substring(0, 3)));
    }
  }

  @override
  void initState() {
    fillTheDates();
    _controller = TabController(length: _formatedDays.length, vsync: this);

    super.initState();
  }

  int selectedIndex = 0;
  String time = '_ _ _';
  int guest = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Reserve Table'),
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height -
                (kToolbarHeight + MediaQuery.of(context).padding.top - 10),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ksv30,
                    SizedBox(
                      height: 47,
                      width: 55,
                      child: Image.asset(
                        'asset/images/tablebooking/dinner_table.png',
                        height: 47,
                      ),
                    ),
                    ksv30,
                    SizedBox(
                      height: 64,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: .75),
                            child: Divider(
                              thickness: 1,
                              height: 1,
                              color: kcgrey3,
                            ),
                          ),
                          TabBar(
                              onTap: (int index) {
                                selectedIndex = index;
                                setState(() {});
                              },
                              indicatorWeight: 2.5,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelColor: kcred,
                              unselectedLabelColor: kcNestedTabcolor,
                              unselectedLabelStyle: ktsAnreg.copyWith(
                                  color: kcred,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Master'),
                              labelStyle: ktsAnreg.copyWith(
                                  color: kcred,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Master'),
                              isScrollable: true,
                              controller: _controller,
                              tabs: _formatedDays
                                  .map((e) => Tab(
                                        iconMargin:
                                            const EdgeInsets.only(bottom: 8),
                                        text: selectedIndex == e.index
                                            ? e.day
                                            : e.dayWithMonth.toUpperCase(),
                                        icon: TabIcon(
                                          isSelcted: e.index == selectedIndex,
                                        ),
                                      ))
                                  .toList()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: NestedTab(
                          tap: () {
                            setState(() {});
                          },
                          tabTIme: (String tabtime) {},
                          indexer: (int guestCount) {
                            guest = guestCount;
                          },
                          stringify: (String t) {
                            time = t;
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    height: 85,
                    decoration: const BoxDecoration(
                      color: kcred,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$guest guest',
                                style: nestedBaseStyle.copyWith(
                                    color: kcwhite, fontSize: 12),
                              ),
                              Text(
                                time == ''
                                    ? "_ _ _"
                                    : '${_formatedDays[selectedIndex].dayWithMonth},${time.toUpperCase()}',
                                style: nestedBaseStyle.copyWith(
                                  color: kcwhite,
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      maintainState: false,
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context,
                                              Animation<double> _ami1,
                                              Animation<double> _anim2) =>
                                          SlideTransition(
                                            position: Tween<Offset>(
                                                    begin: const Offset(0, .5),
                                                    end: const Offset(0, 0))
                                                .animate(CurvedAnimation(
                                                    parent: _ami1,
                                                    curve: Curves.decelerate)),
                                            child: const ConfirmPopUp(),
                                          ),
                                      opaque: false,
                                      barrierDismissible: true,
                                      barrierColor: Colors.black54));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: kcwhite,
                              ),
                              child: const Center(
                                child: Text(
                                  'RESERVE',
                                  style: nestedBaseStyle,
                                ),
                              ),
                            ),
                          )
                        ]))
              ],
              alignment: Alignment.bottomCenter,
            )),
      ),
    );
  }
}

typedef Stringify = Function(String);

class NestedTab extends StatefulWidget {
  const NestedTab({
    Key? key,
    required this.indexer,
    required this.stringify,
    required this.tabTIme,
    required this.tap,
  }) : super(key: key);
  final Indexer indexer;
  final Stringify stringify, tabTIme;
  final VoidCallback tap;

  @override
  State<NestedTab> createState() => _NestedTabState();
}

class _NestedTabState extends State<NestedTab>
    with SingleTickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    _nestedTabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<String> tabs = <String>['Breakfast', 'Lunch', 'Dinner'];
  List<String> times = <String>[
    '08:30 am',
    '09:00 am',
    '09:30 am',
    '10:00 am',
    '10:30 am',
    '11:00 am'
  ];
  List<String> noon = <String>[
    '11:00 am',
    '12:00 pm',
    '01:00 pm',
    '02:00 pm',
    '03:00 pm',
    '04:00 pm'
  ];
  List<String> evening = <String>[
    '05:00 am',
    '06:00 pm',
    '07:00 pm',
    '08:00 pm',
    '09:00 pm',
    '9:30 pm'
  ];
  int selectedtime = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  kcTransparent.withOpacity(.018),
                  kcTransparent.withOpacity(.008),
                ])),
            height: 66,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: TabBar(
                onTap: (int index) {
                  widget.tabTIme(times[index]);
                },
                indicatorPadding: const EdgeInsets.only(top: 10),
                indicatorWeight: 2.5,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: kcred,
                unselectedLabelColor: kcNestedTabcolor,
                unselectedLabelStyle: ktsAnreg.copyWith(
                    color: kcred,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Master'),
                labelStyle: ktsAnreg.copyWith(
                    color: kcred,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Master'),
                isScrollable: true,
                controller: _nestedTabController,
                tabs: tabs
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
            )),
        Expanded(
            child: TabBarView(controller: _nestedTabController, children: [
          TimeGrid(
            tap: widget.tap,
            times: times,
            stringify: widget.stringify,
          ),
          TimeGrid(tap: widget.tap, times: noon, stringify: widget.stringify),
          TimeGrid(tap: widget.tap, times: evening, stringify: widget.stringify)
        ])),
        Expanded(
            child: Column(
          children: [
            const Spacer(),
            const Text(
              'Number of Guest',
              style: nestedBaseStyle,
            ),
            ksv18,
            GuestNumber(
              indexer: widget.indexer,
              ontap: widget.tap,
            ),
            const Spacer(),
            const SizedBox(
              height: 100,
            )
          ],
        )),
      ],
    );
  }
}

class TabIcon extends StatelessWidget {
  const TabIcon({Key? key, required this.isSelcted}) : super(key: key);
  final bool isSelcted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelcted ? kcred : kcwhite,
          border: isSelcted
              ? Border.all(color: kcred)
              : Border.all(color: kcgrey5, width: 1.5)),
    );
  }
}

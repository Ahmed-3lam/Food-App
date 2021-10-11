import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/searchitempage/searchitempage.dart';

import 'compo/searchfiltercopytoggletile.dart';

class SearchFilterCopy extends StatefulWidget {
  const SearchFilterCopy({Key? key}) : super(key: key);

  @override
  _SearchFilterCopyState createState() => _SearchFilterCopyState();
}

class _SearchFilterCopyState extends State<SearchFilterCopy> {
  int selctone = 1;
  int sortby = 1;
  int morefilter = 0;
  bool isactive = false;
  void tap() {}

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
        actions: [
          SizedBox(
            width: 35,
            height: 30,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                isactive = !isactive;

                setState(() {});
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  MyFlutterApp.lines3,
                  color: kclighblack,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
        leadingWidth: 50,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 48,
            child: TxtField(
              filledColor: kcgrey3,
              hint: "Find Adress",
              hintstyle: const TextStyle(color: kcgrey4),
              prefix: const Icon(
                MyFlutterApp.search,
                color: kcgrey5,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Center(
          child: Padding(
            padding: kpaddinghor20,
            child: MasterButton(
              name: "Confirm",
              onTap: () {
                RouteX.sliderRighToLeft(context, const SearchITem());
              },
              height: 48,
            ),
          ),
        ),
      ),
      body: isactive
          ? SingleChildScrollView(
              key: const ValueKey('SingleChildScrollviewKey'),
              child: Padding(
                padding: kpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FoodText.ktsAnreg(
                      "District",
                      fonsize: 16,
                      weight: FontWeight.w500,
                    ),
                    ksv16,
                    Row(
                      children: [
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: selctone == 0,
                              tap: () {
                                selctone = 0;
                                setState(() {});
                              },
                              name: "District 1"),
                        ),
                        ksh12,
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: selctone == 1,
                              tap: () {
                                selctone = 1;
                                setState(() {});
                              },
                              name: "District 2"),
                        ),
                        ksh12,
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: selctone == 2,
                              tap: () {
                                selctone = 2;
                                setState(() {});
                              },
                              name: "District 3"),
                        ),
                      ],
                    ),
                    ksv16,
                    Row(
                      children: [
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: selctone == 3,
                              tap: () {
                                selctone = 3;
                                setState(() {});
                              },
                              name: "District 4"),
                        ),
                        ksh12,
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: selctone == 4,
                              tap: () {
                                selctone = 4;
                                setState(() {});
                              },
                              name: "District 5"),
                        ),
                        ksh12,
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    ksv30,
                    const FoodText.ktsAnreg(
                      "Sory by",
                      fonsize: 16,
                      weight: FontWeight.w500,
                    ),
                    ksv16,
                    Row(
                      children: [
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: sortby == 0,
                              tap: () {
                                sortby = 0;
                                setState(() {});
                              },
                              name: "Recommended"),
                        ),
                        ksh12,
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: sortby == 1,
                              tap: () {
                                sortby = 1;
                                setState(() {});
                              },
                              name: "Popularity"),
                        ),
                      ],
                    ),
                    ksv30,
                    const FoodText.ktsAnreg(
                      "More Filter",
                      fonsize: 16,
                      weight: FontWeight.w500,
                    ),
                    ksv16,
                    Row(
                      children: [
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: morefilter == 0,
                              tap: () {
                                morefilter = 0;
                                setState(() {});
                              },
                              name: "Promotion"),
                        ),
                        ksh12,
                        Expanded(
                          child: SearchFilterCopyToggleTile(
                              selctone: morefilter == 1,
                              tap: () {
                                morefilter = 1;
                                setState(() {});
                              },
                              name: "Pick up"),
                        ),
                        ksh24,
                      ],
                    )
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
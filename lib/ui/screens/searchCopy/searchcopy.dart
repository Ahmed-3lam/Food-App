import 'package:flutter/foundation.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/searchfiltercopy/compo/searchfiltercopytoggletile.dart';
import 'package:frontend/ui/screens/searchfiltercopy/searchfiltercopy.dart';

import 'compo/appbar.dart';

class SearchCopy extends StatefulWidget {
  const SearchCopy({Key? key}) : super(key: key);

  @override
  State<SearchCopy> createState() => _SearchCopyState();
}

class _SearchCopyState extends State<SearchCopy> {
  int selctone = 1;
  int sortby = 1;
  int morefilter = 0;
  bool isactive = false;
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController()..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchCopyAppbar(context, controller: _controller),
      body: SingleChildScrollView(
        child: Padding(
          padding: kpadding,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///WE CAN MAP THE DATA ON THE BASIS OF RESULTS AND PASS THE CONTROLLER
            const SearchClearTile(
              name: "Recent history",
            ),
            SearchCopyResultTile(
              name: "Cookie Heaven",
              controller: _controller,
              tap: () {},
            ),
            SearchCopyResultTile(
              name: "Pizza",
              controller: _controller,
              tap: () {},
            ),
            SearchCopyResultTile(
              name: "Romena",
              controller: _controller,
              tap: () {},
            ),
            SearchCopyResultTile(
              name: "lSpelenza",
              controller: _controller,
              tap: () {},
            ),
            ksv16,
            const FoodText("Trending"),
            ksv30,
            Row(
              children: [
                Expanded(
                  child: SearchFilterCopyToggleTile(
                      selctone: selctone == 0,
                      tap: () {
                        _controller.text = "Bubble Tea";
                        RouteX.sliderRighToLeft(
                            context, const SearchFilterCopy());
                        selctone = 0;
                        setState(() {});
                      },
                      name: "Westen Cuisine"),
                ),
                ksh12,
                Expanded(
                  child: SearchFilterCopyToggleTile(
                      selctone: selctone == 1,
                      tap: () {
                        _controller.text = "Bubble Tea";
                        RouteX.sliderRighToLeft(
                            context, const SearchFilterCopy());
                        selctone = 1;
                        setState(() {});
                      },
                      name: "Bubble Tea"),
                ),
              ],
            ),
            ksv16,
            Row(children: [
              Expanded(
                child: SearchFilterCopyToggleTile(
                    selctone: selctone == 2,
                    tap: () {
                      _controller.text = "Bubble Tea";
                      RouteX.sliderRighToLeft(
                          context, const SearchFilterCopy());
                      selctone = 2;
                      setState(() {});
                    },
                    name: "Spegheti"),
              ),
              ksh12,
              Expanded(
                child: SearchFilterCopyToggleTile(
                    selctone: selctone == 3,
                    tap: () {
                      _controller.text = "Bubble Tea";
                      RouteX.sliderRighToLeft(
                          context, const SearchFilterCopy());
                      selctone = 3;
                      setState(() {});
                    },
                    name: "Coffee"),
              ),
              ksh18
            ]),
            ksv16,
            Row(children: [
              Expanded(
                child: SearchFilterCopyToggleTile(
                    selctone: selctone == 4,
                    tap: () {
                      _controller.text = "Bubble Tea";
                      RouteX.sliderRighToLeft(
                          context, const SearchFilterCopy());
                      selctone = 4;
                      setState(() {});
                    },
                    name: "Tea"),
              ),
              ksh12,
              Expanded(
                child: SearchFilterCopyToggleTile(
                    selctone: selctone == 5,
                    tap: () {
                      _controller.text = "Bubble Tea";
                      RouteX.sliderRighToLeft(
                          context, const SearchFilterCopy());
                      selctone = 5;
                      setState(() {});
                    },
                    name: "Noddle"),
              ),
              ksh12,
              Expanded(
                child: SearchFilterCopyToggleTile(
                    selctone: selctone == 6,
                    tap: () {
                      _controller.text = "Bubble Tea";
                      RouteX.sliderRighToLeft(
                          context, const SearchFilterCopy());
                      selctone = 6;
                      setState(() {});
                    },
                    name: "Pizza"),
              ),
              ksh18
            ]),
          ]),
        ),
      ),
    );
  }
}

class SearchCopyResultTile extends StatelessWidget {
  const SearchCopyResultTile(
      {Key? key,
      required this.name,
      required this.controller,
      required this.tap})
      : super(key: key);
  final String name;
  final TextEditingController controller;
  final Function tap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        height: 30,
        child: MaterialButton(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          onPressed: () {
            controller.text = name;
            FocusScope.of(context).nextFocus();
            tap();
          },
          child: Row(
            children: [
              FoodText(name),
              const Spacer(),
              const Icon(
                Icons.close,
                color: kcred,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchClearTile extends StatelessWidget {
  const SearchClearTile({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        children: [
          FoodText(name),
          const Spacer(),
          SizedBox(
            height: 30,
            width: 65,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: const FoodText(
                "Clear all",
                color: kcred,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/locationadress/locationadress.dart';
import 'package:frontend/ui/widgets/appbar.dart';
import 'package:frontend/ui/widgets/button.dart';
import 'package:frontend/ui/widgets/texfield.dart';

class LocationChooseCity extends StatefulWidget {
  const LocationChooseCity({Key? key}) : super(key: key);

  @override
  _LocationChooseCityState createState() => _LocationChooseCityState();
}

class _LocationChooseCityState extends State<LocationChooseCity> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: comanAppBar(context, "Select Pronvince/City"),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Center(
          child: Padding(
            padding: kpaddinghor20,
            child: MasterButton(
                name: "Confirm",
                onTap: () {
                  RouteX.sliderRighToLeft(context, const LocationAddress());
                }),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kpaddinghor20,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 48,
                child: TxtField(
                  filledColor: kcgrey3,
                  hint: "Search",
                  hintstyle: const TextStyle(color: kcgrey5),
                  prefix: const Icon(
                    MyFlutterApp.search,
                    color: kcgrey5,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      LocationChooseCityTile(
                        tap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        isselected: index == selectedIndex,
                      ),
                      const Divider(
                        height: 1,
                        color: kcdivider,
                        thickness: 2,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationChooseCityTile extends StatefulWidget {
  const LocationChooseCityTile(
      {Key? key, required this.isselected, required this.tap})
      : super(key: key);
  final bool isselected;
  final VoidCallback tap;

  @override
  State<LocationChooseCityTile> createState() => _LocationChooseCityTileState();
}

class _LocationChooseCityTileState extends State<LocationChooseCityTile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: kcpurpel,
      splashColor: kcred,
      padding: EdgeInsets.zero,
      onPressed: widget.tap,
      child: SizedBox(
        height: 85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const FoodText(
                  "Edinburgh",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(MyFlutterApp.done,
                        color: widget.isselected ? kcred : kcTransparent))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const FoodText(
              "200 Stores",
              color: kctxtcolor,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

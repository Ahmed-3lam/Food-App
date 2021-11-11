import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/booktable/booktable.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({Key? key}) : super(key: key);

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  late DateRangePickerController _controller;
  @override
  void initState() {
    _controller = DateRangePickerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: size.height * .8,
            color: kcCalanderbc,
            child: Column(
              children: [
                Padding(
                  padding: kpaddinghor17,
                  child: SizedBox(
                    child: SfDateRangePickerTheme(
                        data: SfDateRangePickerThemeData(
                          todayTextStyle: const TextStyle(
                            color: kcGradient1,
                          ),
                          brightness: Brightness.dark,
                          backgroundColor: kcCalanderbc,
                          selectionTextStyle: const TextStyle(
                            color: kcwhite,
                          ),
                        ),
                        child: SfDateRangePicker(
                          headerHeight: 50,
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs a) {},
                          todayHighlightColor: kcCalanderbc,
                          controller: _controller,
                          enablePastDates: false,
                          showNavigationArrow: true,
                          selectionShape:
                              DateRangePickerSelectionShape.rectangle,
                        )),
                  ),
                ),
                Container(
                  height: size.height * .2,
                  width: size.width,
                  color: kcCalanderbc,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      SvgPicture.asset("asset/images/illustration/chair.svg",
                          height: 40),
                      ksv16,
                      const Material(
                        color: kcCalanderbc,
                        child: FoodText(
                          "22 Seats are availble",
                          color: kcwhite,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                    width: 200,
                    height: 40,
                    child: MasterButton(
                        name: "Next",
                        onTap: () {
                          RouteX.fadeIn(context, const ConfirmTable());
                        })),
                ksv18,
              ],
            ),
          )
        ],
      ),
    );
  }
}

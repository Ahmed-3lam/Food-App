import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/ui/screens/NewTable/tablereservaion/tablereservaion.dart';
import 'package:frontend/ui/screens/details/deliverypage/compo/detaildeliveryoffertile.dart';
import 'package:frontend/ui/screens/details/deliverypage/compo/detailsdeliverysearchresulttile.dart';
import 'package:frontend/ui/screens/details/detailmodel.dart';
import 'package:provider/provider.dart';

class DetailsDeliveyPage extends StatefulWidget {
  const DetailsDeliveyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsDeliveyPage> createState() => _DetailsDeliveyPageState();
}

class _DetailsDeliveyPageState extends State<DetailsDeliveyPage> {
  List<String> items = ['Re-Order', 'Cancel'];
  bool dowehaveorders = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Padding(
            padding: kpaddinghor20,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksv30,
                  MasterButton(
                    textcolor: kcred,
                    name: "Book a Table",
                    onTap: () {
                      RouteX.sliderRighToLeft(context, const ReserveTable());
                    },
                    isOutlined: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DetailDeliveryOfferTile(
                      color: kclightpurpel,
                      data: MyFlutterApp.fastfood,
                      offerdata: "Use code \"FREESHIP\" to get free delivery"),
                  const DetailDeliveryOfferTile(
                      color: kcpurpel,
                      data: MyFlutterApp.tag,
                      offerdata: "Use code \"FREESHIP\" to get free delivery"),
                  const Divider(
                    color: kcdivider,
                    height: 3,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      child: Row(
                        children: [
                          const Icon(
                            MyFlutterApp.cart,
                            color: kcicon,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Your last order - 1 item"),
                              Text(
                                "BBQ pork ribs",
                                style:
                                    TextStyle(color: kctxtcolor, fontSize: 12),
                              ),
                            ],
                          ),
                          const Spacer(),
                          DropDownBox(
                              option: '',
                              width: 120,
                              item: items,
                              value: (value) {})
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: kcdivider,
                    height: 3,
                    thickness: 2,
                  ),
                  const SizedBox(height: 13),
                  const Text(
                    "Dishes And Menu",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 25),
                  ...List.generate(
                      dishes.length,
                      (index) => Consumer<DetailsModel>(
                            builder:
                                (BuildContext context, model, Widget? child) =>
                                    DetailsSearchResultTile(
                              count: index,
                              decrement: (int y) {
                                model.removeProduct(
                                  dishes[index],
                                );
                              },
                              increment: (int x) {
                                model.addProduct(
                                  dishes[index],
                                );
                              },
                              image: dishes[index].image,
                              name: dishes[index].name,
                            ),
                          )).toList(),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

typedef BoxValue = Function(String?);

class DropDownBox extends StatefulWidget {
  const DropDownBox({
    Key? key,
    required this.option,
    required this.width,
    required this.item,
    this.style = ktsAnsemi,
    required this.value,
  }) : super(key: key);
  final String option;
  final List<String> item;
  final TextStyle? style;
  final BoxValue value;

  final double width;
  @override
  _DropDownBoxState createState() => _DropDownBoxState();
}

class _DropDownBoxState extends State<DropDownBox> {
  String dropdownValue = "";
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.item[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: 40,
          width: widget.width,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: const Padding(
                padding: EdgeInsets.zero, child: Icon(Icons.arrow_drop_down)),
            iconSize: 30,
            elevation: 16,
            style: ktsAnsemi.copyWith(fontSize: 14, color: kcDeactivateIcon),
            underline: Container(
              color: kcTransparent,
            ),
            onChanged: (String? newValue) {
              if (newValue != null) {
                dropdownValue = newValue;
                widget.value(newValue);
                setState(() {});
              }
            },
            items: widget.item.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

const Color kcDeactivateIcon = Color(0xff8B8B8B);
const Color kcDeactivateTextColor = Color(0xff464646);
const Color kcDeactivate = Color(0xffECEEEF);

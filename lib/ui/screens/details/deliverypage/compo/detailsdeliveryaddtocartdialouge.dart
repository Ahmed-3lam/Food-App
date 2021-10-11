import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/ui/screens/orderdetails2/confirmorder.dart';
import 'package:frontend/ui/screens/orderfailed/orderdetails.dart';

import 'detailsdeliverysearchresulttile.dart';

class DetailsDeliveryAddToCartDialouge extends StatefulWidget {
  const DetailsDeliveryAddToCartDialouge({
    Key? key,
    required this.totalitemcount,
  }) : super(key: key);
  final int totalitemcount;

  @override
  State<DetailsDeliveryAddToCartDialouge> createState() =>
      _DetailsDeliveryAddToCartDialougeState();
}

class _DetailsDeliveryAddToCartDialougeState
    extends State<DetailsDeliveryAddToCartDialouge> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context, count);
            },
            child: Container(
              color: kcTransparent,
              height: MediaQuery.of(context).size.height - 475,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: kcwhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            height: 475,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(50)),
              child: Scaffold(
                body: Padding(
                  padding: kpadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(
                            MyFlutterApp.arrowback,
                            color: Colors.black,
                          ),
                          Spacer(),
                          FoodText.ktsAnreg(
                            "Customize the item",
                            fonsize: 22,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Spacer(),
                        ],
                      ),
                      DetailsSearchResultTile(
                        count: widget.totalitemcount,
                        i: (int i) {
                          count = i;
                        },
                        d: (int i) {
                          count = i;
                        },
                        image: dishes[0].image,
                        name: dishes[0].name,
                      ),
                      const Divider(
                        thickness: 2,
                        color: kcdivider,
                      ),
                      const FoodText(
                        "Choose sauce",
                        fonsize: 16,
                      ),
                      ksv16,
                      DetailsDeliveryDialougeToggleTile(
                          selctone: true, tap: () {}, name: "Honey BBQ"),
                      ksv12,
                      DetailsDeliveryDialougeToggleTile(
                          selctone: true, tap: () {}, name: "Teriyaki Sauce"),
                      ksv12,
                      DetailsDeliveryDialougeToggleTile(
                          selctone: true, tap: () {}, name: "Mustard Sauce"),
                      ksv12,
                      DetailsDeliveryDialougeToggleTile(
                          selctone: true, tap: () {}, name: "Chilli Sauce"),
                      const Spacer(),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            RouteX.sliderRighToLeft(
                                context, const OrderFailed());
                          },
                          child: MasterButton(
                              name: "Add to cart",
                              onTap: () {
                                RouteX.sliderRighToLeft(
                                    context, const ConfirmOrder());
                              }),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsDeliveryDialougeToggleTile extends StatefulWidget {
  const DetailsDeliveryDialougeToggleTile({
    Key? key,
    required this.selctone,
    required this.tap,
    required this.name,
  }) : super(key: key);

  final bool selctone;
  final VoidCallback tap;
  final String name;

  @override
  State<DetailsDeliveryDialougeToggleTile> createState() =>
      _DetailsDeliveryDialougeToggleTileState();
}

class _DetailsDeliveryDialougeToggleTileState
    extends State<DetailsDeliveryDialougeToggleTile> {
  bool selctone = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            selctone = !selctone;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            height: 21,
            width: 20,
            decoration: BoxDecoration(
                color: selctone ? kcred : null,
                borderRadius: BorderRadius.circular(4.5),
                border: Border.all(
                    color: selctone ? kcred : kcdivider, width: 1.5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Icons.done,
                  size: 17.5,
                  color: widget.selctone ? kcwhite : kcTransparent,
                ),
              ),
            ),
          ),
        ),
        ksh12,
        FoodText(widget.name),
        const Spacer(),
        FoodText(selctone ? "\$10" : "\$0")
      ],
    );
  }
}

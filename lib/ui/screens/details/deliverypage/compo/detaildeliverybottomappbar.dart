import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/paddings.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/details/detailmodel.dart';
import 'package:provider/provider.dart';

import 'details_delivery_add_to_cart_dialog.dart';

class DetailDeliveryBottomAppBar extends StatefulWidget {
  const DetailDeliveryBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailDeliveryBottomAppBar> createState() =>
      _DetailDeliveryBottomAppBarState();
}

class _DetailDeliveryBottomAppBarState
    extends State<DetailDeliveryBottomAppBar> {
  Future<dynamic> _buildDialouge() {
    return Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          barrierDismissible: true,
          barrierColor: Colors.black54,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder:
              (context, Animation<double> _ami1, Animation<double> _anim2) =>
                  SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0, .5), end: const Offset(0, 0))
                .animate(
                    CurvedAnimation(parent: _ami1, curve: Curves.decelerate)),
            child: const DetailsDeliveryAddToCartDialog(
              totalitemcount: 1,
            ),
          ),
        ));
  }

  int ordercount = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsModel>(
      builder: (BuildContext context, model, Widget? child) => GestureDetector(
        onTap: () {
          _buildDialouge();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: model.getProduct.isNotEmpty ? 60 : 0,
          child: Container(
            height: 60,
            color: kcred,
            child: Center(
              child: Padding(
                padding: kpaddinghor20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: kclightred,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: FoodText("${model.totaitem()}",
                              color: Colors.white)),
                    ),
                    Builder(builder: (context) {
                      return const FoodText.ktsAnsemi(
                        "View Order",
                        color: kcwhite,
                        fontSize: 18,
                      );
                    }),
                    Container(
                      height: 32,
                      width: 62,
                      decoration: BoxDecoration(
                        border: Border.all(color: kclightred, width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: FoodText("\$${150 * model.totaitem()}",
                              color: kcwhite)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

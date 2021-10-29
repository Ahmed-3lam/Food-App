import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/paddings.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/details/detailmodel.dart';
import 'package:provider/provider.dart';

import 'detailsdeliveryaddtocartdialouge.dart';

class DetailDeliveryBottomAppbar extends StatefulWidget {
  const DetailDeliveryBottomAppbar({
    Key? key,
    required this.totalItemCount,
  }) : super(key: key);
  final int totalItemCount;

  @override
  State<DetailDeliveryBottomAppbar> createState() =>
      _DetailDeliveryBottomAppbarState();
}

class _DetailDeliveryBottomAppbarState
    extends State<DetailDeliveryBottomAppbar> {
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
            child: const DetailsDeliveryAddToCartDialouge(
              totalitemcount: 1,
            ),
          ),
        ));
  }

  int ordercount = 0;
  @override
  Widget build(BuildContext context) {
    print('Builded this one');
    return Consumer<DetailsModel>(
      builder: (BuildContext context, model, Widget? child) => GestureDetector(
        onTap: () {
          _buildDialouge();
        },
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
                      fonsize: 18,
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
    );
  }
}

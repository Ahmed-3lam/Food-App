import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/addcard/addcard.dart';

//note the My Card widget depends on the cards repo for the source of images so we can
//modify the other but not image part from the cards repo

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.index,
    required this.name,
    required this.id,
    required this.exp,
    required this.isItaddcard,
  }) : super(key: key);
  final int index;
  final String name, id, exp;
  final bool isItaddcard;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff224a5d),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 191,
        width: MediaQuery.of(context).size.width - 34,
        child: Stack(children: [
          Positioned(
            bottom: -75,
            right: -30,
            child: SvgPicture.asset(
              cards[index].ovl1,
              matchTextDirection: true,
            ),
          ),
          Positioned(
            top: -115,
            left: -75,
            //Don't modify this model
            child: SvgPicture.asset(
              cards[index].ovl2,
              matchTextDirection: true,
            ),
          ),
          Positioned(
              top: 170 / 2,
              left: 10,
              child: Text(
                id,
                style: ktsAnreg.copyWith(color: kcwhite, fontSize: 18),
              )),
          Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                name,
                style: ktsAnreg.copyWith(color: kcwhite, fontSize: 18),
              )),
          Positioned(
              bottom: 10,
              right: 30,
              child: Text(
                "EXP DATE\n$exp",
                textAlign: TextAlign.center,
                style: ktsAnreg.copyWith(color: kcwhite, fontSize: 14),
              )),
          Positioned(
              top: 10,
              left: 10,
              child: Image.asset(
                "asset/images/payment/visa.png",
                scale: 14,
              )),
          !isItaddcard
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        RouteX.sliderRighToLeft(context, const AddCard());
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: kcwhite,
                        size: 18,
                      )))
              : const SizedBox(),
        ]),
      ),
    );
  }
}

List<PaymentCardModel> cards = <PaymentCardModel>[
  const PaymentCardModel(
      name: "dannis albert",
      id: "1234  5678  1234  5678",
      ovl1: 'asset/images/payment/01.svg',
      ovl2: 'asset/images/payment/02.svg'),
  const PaymentCardModel(
      name: "nis albert",
      id: "1234  5678  1234  5678",
      ovl1: 'asset/images/payment/04.svg',
      ovl2: 'asset/images/payment/03.svg'),
];

class PaymentCardModel {
  const PaymentCardModel({
    required this.name,
    required this.id,
    required this.ovl1,
    required this.ovl2,
  });
  final String name;
  final String ovl2;
  final String ovl1;
  final String id;
}

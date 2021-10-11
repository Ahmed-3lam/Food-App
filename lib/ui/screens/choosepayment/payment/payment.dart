import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/addcard/addcard.dart';
import 'compo.dart/mycard.dart';
import 'compo.dart/paymethodtile.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late PageController _pageController;
  final String payPath = "asset/payment/";
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .9);
  }

  int currenPage = 0;
  int cardselect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcwhite,
      appBar: comanAppBar(
        context,
        "Payment Options",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 31,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(children: [
                Text(
                  "My Cards",
                  style: ktsAnreg.copyWith(fontSize: 16),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    RouteX.sliderRighToLeft(context, const AddCard());
                  },
                  child: Container(
                      height: 32 * .90,
                      width: 40 * .85,
                      child: const Icon(Icons.add, color: kcwhite),
                      decoration: BoxDecoration(
                          color: kcred,
                          borderRadius: BorderRadius.circular(7))),
                )
              ]),
            ),
            const SizedBox(
              height: 21,
            ),
            GestureDetector(
              onTap: () {
                cardselect = 0;
                setState(() {});
              },
              child: SizedBox(
                height: 191,
                child: PageView.builder(
                  onPageChanged: (page) {
                    currenPage = page;
                    setState(() {});
                  },
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimatedPadding(
                      curve: Curves.linearToEaseOut,
                      duration: const Duration(milliseconds: 800),
                      padding: index != currenPage
                          ? const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5)
                          : const EdgeInsets.symmetric(horizontal: 5),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            border: Border.all(
                                color: index != currenPage
                                    ? Colors.transparent
                                    : cardselect == 0
                                        ? kcred
                                        : Colors.transparent,
                                width: 3)),
                        child: MyCard(
                            isItaddcard: false,
                            index: !index.isOdd ? 0 : 1,
                            name: cards[index].name.toUpperCase(),
                            id: cards[index].id.toUpperCase(),
                            exp: "10/24"),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: kpadding,
              child: const Text(
                "Othre payment options",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PayMethod(
                ontap: () {
                  setState(() {
                    cardselect = 1;
                  });
                },
                isselected: cardselect == 1,
                name: "Paypal",
                mail: "Mypaypal@gmail.com",
                asset: "paypal"),
            ksv10,
            PayMethod(
                ontap: () {
                  setState(() {
                    cardselect = 2;
                  });
                },
                isselected: cardselect == 2,
                name: "Cash On Delivery",
                mail: "Pay in cash",
                asset: "not"),
            ksv10,
            PayMethod(
                ontap: () {
                  setState(() {
                    cardselect = 3;
                  });
                },
                isselected: cardselect == 3,
                name: "Apple Pay",
                mail: "applepay.com",
                asset: "apple"),
          ],
        ),
      ),
    );
  }
}

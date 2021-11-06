import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/payment/addcard/addcard.dart';
import 'package:frontend/ui/screens/payment/payment/compo.dart/mycard.dart';
import 'package:frontend/ui/utils/textutlities.dart';

import 'compo/adresstile.dart';
import 'compo/paymethod.dart';

class CheckOutPayment extends StatefulWidget {
  const CheckOutPayment({Key? key}) : super(key: key);

  @override
  State<CheckOutPayment> createState() => _CheckOutPaymentState();
}

class _CheckOutPaymentState extends State<CheckOutPayment> {
  bool isSelected = false;
  int x = 0;
  int cardselect = 0;
  late TextEditingController cardHolder, cardNumber, expirationDate, cvv;
  late PageController _pageController;
  final String payPath = "asset/properImages/payment/";

  int currenPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .9);
    cardHolder = TextEditingController(text: "John Alberto");
    cardNumber = TextEditingController(text: "1234 4567 8947");
    expirationDate = TextEditingController(text: "10/24");
    cvv = TextEditingController(
      text: 123.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: MasterButton(onTap: () {}, name: "Pay Now"),
          ),
        ),
      ),
      appBar: comanAppBar(
        context,
        "Checkout",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: childSpacer([
              const SizedBox(),
              Padding(
                padding: kpaddinghor20,
                child: Text(
                  "Select Payment System",
                  style: FontStyleUtilities.h5(fontWeight: FWT.semiBold),
                ),
              ),
              Padding(
                padding: kpaddinghor20,
                child: Row(children: [
                  Text(
                    "My Cards",
                    style: ktsAnsemi.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      RouteX.sliderRighToLeft(context, const AddCard());
                    },
                    child: Container(
                        height: 32 * .90,
                        width: 40 * .85,
                        child: const Icon(
                          Icons.add,
                          color: kcwhite,
                        ),
                        decoration: BoxDecoration(
                            color: kcred,
                            borderRadius: BorderRadius.circular(7))),
                  )
                ]),
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
                                vertical: 10, horizontal: 0)
                            : const EdgeInsets.symmetric(horizontal: 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
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
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PayMethod(
                  ontap: () {
                    setState(() {
                      cardselect = 1;
                      // navigator(context, const Payment());
                    });
                  },
                  isselected: cardselect == 1,
                  name: "Paypal",
                  mail: "Mypaypal@gmail.com",
                  asset: "paypal"),
              PayMethod(
                  ontap: () {
                    setState(() {
                      cardselect = 2;
                      // navigator(context, const Payment());
                    });
                  },
                  isselected: cardselect == 2,
                  name: "Cash On Delivery",
                  mail: "Pay in cash",
                  asset: "not"),
              PayMethod(
                  ontap: () {
                    setState(() {
                      cardselect = 3;
                      // navigator(context, const Payment());
                    });
                  },
                  isselected: cardselect == 3,
                  name: "Apple Pay",
                  mail: "applepay.com",
                  asset: "apple"),
              const SizedBox(),
            ], 15),
          ),
        ),
      ),
    );
  }
}

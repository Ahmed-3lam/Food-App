import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/checkoutscreen/checkout.dart';
import 'package:frontend/ui/screens/choosepayment/payment/compo.dart/mycard.dart';
import 'package:frontend/ui/screens/comancontainerpage/comancontainerizedpage.dart';
import 'package:frontend/ui/widgets/textfielwithtitel.dart';
import 'package:stacked/stacked.dart';

import 'addcardmodel.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  late TextEditingController cardHolder, cardNumber, expirationDate, cvv;

  @override
  void initState() {
    super.initState();
    cardHolder = TextEditingController(text: "John Alberto")
      ..addListener(() {
        setState(() {});
      });
    cardNumber = TextEditingController(text: "1234 4567 8947")
      ..addListener(() {
        setState(() {});
      });
    expirationDate = TextEditingController(text: "10/24")
      ..addListener(() {
        setState(() {});
      });
    cvv = TextEditingController(
      text: 123.toString(),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCardModel>.reactive(
      viewModelBuilder: () => AddCardModel(),
      builder: (context, model, child) => ComanContaineraziedPag(
        topchild: MyCard(
            isItaddcard: true,
            index: 1,
            name: cardHolder.text.toUpperCase(),
            id: cardNumber.text.toString(),
            exp: expirationDate.text),
        appbarTitel: "Add New Card",
        children: childSpacer([
          MyTextField(
            controller: cardHolder,
            titel: "Card Holder",
          ),
          MyTextField(
            isnumberinput: true,
            controller: cardNumber,
            titel: "Card Number",
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  isnumberinput: true,
                  controller: expirationDate,
                  titel: "Expiration Date",
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: MyTextField(
                  isnumberinput: true,
                  isObsecure: true,
                  controller: cvv,
                  titel: "CVV",
                ),
              ),
            ],
          ),
          // const ToggleTIle(name: "Remember My Card Details"),
          const SizedBox(
            height: 8,
          ),
          MasterButton(
              onTap: () {
                RouteX.sliderRighToLeft(context, const CheckOutPayment());
              },
              name: "Add Card")
        ], 15),
      ),
    );
  }
}

List<Widget> childSpacer(List<Widget> childrens, int size) {
  List<Widget> spacerlist = <Widget>[];

  for (Widget child in childrens) {
    spacerlist.add(child);
    spacerlist.add(const SizedBox(
      height: 15,
    ));
  }

  return spacerlist;
}

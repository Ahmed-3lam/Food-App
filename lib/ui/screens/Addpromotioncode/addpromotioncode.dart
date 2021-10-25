import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/Dialogs/commondialog.dart';

class AddPromotionCode extends StatelessWidget {
  const AddPromotionCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: comanAppBar(context, "Add Promotion Code"),
      body: Padding(
        padding: kpadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RegistrationTextField(
              hint: 'Enter Promo Code',
              prefix: const Icon(MyFlutterApp.search),
            ),
            ksv18,
            const FoodText.ktsAnreg(
              "Free Shiping Code",
              fonsize: 16,
            ),
            ksv18,
            PromotionToggelButton(
              tap: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          backgroundColor: kcTransparent,
                          child: CommonDialog(
                              tittle: 'Applied Successfully',
                              subTittle:
                                  'Your code is validated successfully now you can avail to benefits of the offer ',
                              buttonText: 'Submit',
                              dialogThemeColor: const Color(0xff22A45D),
                              avatarChild: const Icon(
                                Icons.done_all,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ));
              },
            ),
            ksv30,
            const FoodText.ktsAnreg(
              "Discount & Cashback",
              fonsize: 16,
            ),
            ksv18,
            PromotionToggelButton(
              tap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PromotionToggelButton extends StatefulWidget {
  const PromotionToggelButton({Key? key, required this.tap}) : super(key: key);
  final Function tap;

  @override
  State<PromotionToggelButton> createState() => _PromotionToggelButtonState();
}

class _PromotionToggelButtonState extends State<PromotionToggelButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        widget.tap();
        setState(() {});
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: isSelected ? kcred : kcgrey2,
            borderRadius: BorderRadius.circular(13)),
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: [
            Icon(
              MyFlutterApp.map,
              color: isSelected ? kcwhite : kcicon,
            ),
            ksh24,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FoodText.ktsAnreg(
                "Code \$10 off on shipping fee",
                color: isSelected ? kcwhite : kcblack,
                fonsize: 16,
              ),
              FoodText(
                "Expiring in 2 days",
                color: isSelected ? kcwhite : kcblack,
                fonsize: 14,
              ),
            ])
          ],
        ),
      ),
    );
  }
}

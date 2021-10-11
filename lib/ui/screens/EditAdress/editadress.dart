import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/EditAdress/compo/editaddresstoggletile.dart';

import 'compo/editadresstextfield.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  late TextEditingController user, phone, adress, note;

  @override
  void initState() {
    user = TextEditingController(text: 'Michael');
    phone = TextEditingController(text: '123456789');
    adress = TextEditingController(text: '123 Avenue Street');
    note = TextEditingController(text: 'Note');
    super.initState();
  }

  int selctone = 0;
  int deliverto = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kpadding,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksv30,
                  const FoodText.ktsAnreg(
                    "Contact Information",
                    weight: FontWeight.w400,
                    fonsize: 17,
                  ),
                  ksv16,
                  Row(
                    children: [
                      Expanded(
                          child: EditAdressTextField(
                              controller: user,
                              hint: "Michel Jordan",
                              data: const Icon(
                                MyFlutterApp.bolduser,
                                color: kcblack,
                              ))),
                      ksh18,
                      Expanded(
                          child: EditAdressTextField(
                              controller: phone,
                              data: const Icon(
                                MyFlutterApp.phone,
                                size: 19,
                                color: kcblack,
                              ),
                              hint: "1474525555"))
                    ],
                  ),
                  ksv16,
                  EditAdressTextField(
                      controller: adress,
                      data: const Icon(
                        MyFlutterApp.home,
                        color: kcblack,
                      ),
                      hint: "123 Avenue Street"),
                  ksv16,
                  EditAdressTextField(
                      controller: note,
                      data: const Icon(MyFlutterApp.lists, color: kcBlack),
                      hint: "Note"),
                  ksv30,
                  const FoodText.ktsAnreg(
                    "Address Label (Optional)",
                    weight: FontWeight.w400,
                    fonsize: 17,
                  ),
                  ksv30,
                  EditAdressToggleTile(
                    selctone: selctone == 0,
                    name: "Home",
                    tap: () {
                      selctone = 0;
                      setState(() {});
                    },
                  ),
                  ksv16,
                  EditAdressToggleTile(
                    selctone: selctone == 1,
                    name: "Work",
                    tap: () {
                      selctone = 1;
                      setState(() {});
                    },
                  ),
                  ksv30,
                  const FoodText.ktsAnreg(
                    "Deliver to",
                    weight: FontWeight.w400,
                    fonsize: 17,
                  ),
                  ksv30,
                  EditAdressToggleTile(
                    selctone: deliverto == 0,
                    name: "Deliver to door",
                    tap: () {
                      deliverto = 0;
                      setState(() {});
                    },
                  ),
                  ksv16,
                  EditAdressToggleTile(
                    selctone: deliverto == 1,
                    name: "Pickup outside",
                    tap: () {
                      deliverto = 1;
                      setState(() {});
                    },
                  ),
                  const Spacer(),
                  MasterButton(name: "Confirm", onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

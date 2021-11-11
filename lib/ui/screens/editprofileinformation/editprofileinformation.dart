import 'package:frontend/Helpers/mlib.dart';

class EditeprofielInformation extends StatefulWidget {
  const EditeprofielInformation({Key? key}) : super(key: key);

  @override
  State<EditeprofielInformation> createState() =>
      _EditeprofielInformationState();
}

class _EditeprofielInformationState extends State<EditeprofielInformation> {
  late TextEditingController username, phone, address, email;

  @override
  void initState() {
    super.initState();
    username = TextEditingController(text: "Moana Martilui");
    phone = TextEditingController(text: "123456789");
    address = TextEditingController(text: "123 Avenue street");
    email = TextEditingController(text: "example@123gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).nextFocus();
      },
      child: Scaffold(
        appBar: comanAppBar(context, "Edit Information"),
        body: Padding(
          padding: kpaddinghor20,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ksv30,
                ksv10,
                Image.asset(
                  "asset/images/home/oval.png",
                  scale: 3,
                ),
                ksv24,
                ksv24,
                UserDataEditingTiel(
                  name: "Username",
                  controller: username,
                ),
                UserDataEditingTiel(
                  name: "Phone Number",
                  controller: phone,
                  isNumber: true,
                ),
                UserDataEditingTiel(
                  name: "Address",
                  controller: address,
                ),
                UserDataEditingTiel(
                  name: "Email",
                  controller: email,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDataEditingTiel extends StatelessWidget {
  const UserDataEditingTiel({
    Key? key,
    required this.name,
    required this.controller,
    this.isNumber = false,
  }) : super(key: key);
  final String name;
  final TextEditingController controller;
  final bool? isNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Row(
        children: [
          FoodText.ktsAnreg(
            name,
            fonsize: 17,
          ),
          ksh30,
          Expanded(
              child: TextField(
            keyboardType: isNumber! ? TextInputType.phone : null,
            controller: controller,
            style: ktsAnreg.copyWith(color: kctxtcolor, fontSize: 16),
            textAlign: TextAlign.end,
            decoration: InputDecoration.collapsed(hintText: name),
          )),
        ],
      ),
    );
  }
}

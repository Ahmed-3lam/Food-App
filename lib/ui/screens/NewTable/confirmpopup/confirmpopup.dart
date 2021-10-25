import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/NewTable/bookingsuccess/bookingsuccess.dart';
import 'package:frontend/ui/widgets/textfielwithtitel.dart';

class ConfirmPopUp extends StatelessWidget {
  const ConfirmPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                      child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ))),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: kcwhite,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Material(
                  color: kcwhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ksv30,
                      const FoodText(
                        'Confirm Your Details',
                        weight: FontWeight.w500,
                        color: Colors.black,
                        fonsize: 20,
                      ),
                      ksv20,
                      const MyTextField(
                        style: nestedBaseStyle,
                        titel: "Name",
                      ),
                      ksv20,
                      const MyTextField(
                        titel: "Mobile",
                      ),
                      ksv20,
                      MasterButton(
                          name: "Confirm",
                          onTap: () {
                            RouteX.sliderRighToLeft(
                                context, const BookingSuccess());
                          }),
                      ksv30,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

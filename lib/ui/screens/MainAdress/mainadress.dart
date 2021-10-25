import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/services/my_flutter_app_icons.dart';
import 'package:frontend/ui/screens/EditAdress/editadress.dart';
import 'package:frontend/ui/screens/locationadress/locationadress.dart';

import 'package:frontend/ui/widgets/appbar.dart';

class MainAdress extends StatefulWidget {
  const MainAdress({Key? key}) : super(key: key);

  @override
  State<MainAdress> createState() => _MainAdressState();
}

class _MainAdressState extends State<MainAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: comanAppBar(context, "Edit Address"),
      body: SingleChildScrollView(
        child: Padding(
          padding: kpadding,
          child: Column(
            children: [
              TxtField(
                filledColor: kclightwhite,
                hint: "Find Address",
                hintstyle: const TextStyle(color: kcgrey5),
                prefix: const Icon(
                  MyFlutterApp.search,
                  color: kcgrey5,
                  size: 30,
                ),
              ),
              ksv24,
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        RouteX.sliderRighToLeft(
                            context, const LocationAddress());
                      },
                      child: SizedBox(
                          height: 88,
                          width: 88,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "asset/images/location/smallbitmap.jpg",
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FoodText.ktsAnsemi(
                                "123 Avenue street",
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 20,
                                width: 30,
                                child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      RouteX.sliderRighToLeft(
                                          context, const EditAddress());
                                    },
                                    child: const FoodText(
                                      "Edit",
                                      color: kcred,
                                    )),
                              )
                            ],
                          ),
                          const FoodText.ktsAnreg(
                            "Michel Clerk - 035264564",
                            color: kctxtcolor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ksv24,
              const Divider(
                color: kcdivider,
                height: 1,
                thickness: 2,
              ),
              ksv16,
              MasterAdressTile(
                name: "Add Home Address",
                tap: () {
                  RouteX.sliderRighToLeft(context, const EditAddress());
                },
                data: MyFlutterApp.home,
              ),
              MasterAdressTile(
                name: "Add Work Address",
                tap: () {
                  RouteX.sliderRighToLeft(context, const EditAddress());
                },
                data: MyFlutterApp.account,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MasterAdressTile extends StatelessWidget {
  const MasterAdressTile({
    Key? key,
    required this.tap,
    required this.data,
    required this.name,
  }) : super(key: key);
  final VoidCallback tap;
  final IconData data;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: tap,
        child: Row(
          children: [
            Icon(data),
            const SizedBox(
              width: 20,
            ),
            FoodText(name),
            const Spacer(),
            SizedBox(
              height: 20,
              width: 30,
              child: MyICondeButton(
                  icon: const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: kclighblack,
                    ),
                  ),
                  onPressed: tap),
            )
          ],
        ),
      ),
    );
  }
}

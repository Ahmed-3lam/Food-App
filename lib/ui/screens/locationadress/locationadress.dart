import 'package:frontend/Helpers/mlib.dart';

class LocationAddress extends StatelessWidget {
  const LocationAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageRouteBuilder(
                        //         transitionDuration: const Duration(milliseconds: 500),
                        //         reverseTransitionDuration:
                        //             const Duration(milliseconds: 500),
                        //         pageBuilder: (context, Animation<double> _ami1,
                        //                 Animation<double> _anim2) =>
                        //             SlideTransition(
                        //               position: Tween<Offset>(
                        //                       begin: const Offset(0, .5),
                        //                       end: const Offset(0, 0))
                        //                   .animate(CurvedAnimation(
                        //                       parent: _ami1, curve: Curves.decelerate)),
                        //               child: const LocationAdressDialouge(
                        //                 totalitemcount: 1,
                        //               ),
                        //             ),
                        //         opaque: false,
                        //         barrierDismissible: true,
                        //         barrierColor: Colors.black54));
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "asset/images/home/bitmap.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: kcwhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            height: 230,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
              child: Scaffold(
                body: Padding(
                  padding: kpadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      TxtField(
                          hint: "Search location",
                          hintstyle: const TextStyle(
                              color: kcgrey5, fontFamily: "Anreg"),
                          prefix: const Icon(
                            MyFlutterApp.search,
                            color: kcgrey5,
                          ),
                          filledColor: kcgrey3),
                      ksv20,
                      TxtField(
                          hint: "Add details",
                          hintstyle: const TextStyle(
                              color: kcgrey5, fontFamily: "Anreg"),
                          prefix: const Icon(
                            MyFlutterApp.add,
                            color: kcgrey5,
                          ),
                          filledColor: kcgrey3),
                      ksv20,
                      MasterButton(name: "Confirm", onTap: () {})
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationAdressDialouge extends StatefulWidget {
  const LocationAdressDialouge({
    Key? key,
    required this.totalitemcount,
  }) : super(key: key);
  final int totalitemcount;

  @override
  State<LocationAdressDialouge> createState() => _LocationAdressDialougeState();
}

class _LocationAdressDialougeState extends State<LocationAdressDialouge> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
            color: kcwhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        height: 230,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: Scaffold(
            body: Padding(
              padding: kpadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TxtField(
                      hint: "",
                      prefix: const Icon(
                        MyFlutterApp.search,
                        color: kcgrey5,
                      ),
                      filledColor: kcgrey3),
                  ksv20,
                  TxtField(
                      hint: "",
                      prefix: const Icon(
                        MyFlutterApp.add,
                        color: kcgrey5,
                      ),
                      filledColor: kcgrey3),
                  ksv20,
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




//  Column(
//                         children: [
//                          
//                         ],
//                       ),
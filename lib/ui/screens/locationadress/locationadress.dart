import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

var x0 = const LatLng(36.169814362090236, -115.13886921107769);
var x1 = const LatLng(36.16926546409543, -115.13927288353443);
var x2 = const LatLng(36.1692895528948, -115.13781309127806);
var x3 = const LatLng(36.16869084930472, -115.13815138489008);
var x4 = const LatLng(36.16902890627915, -115.13848900794983);
var initialP = const LatLng(36.168956639618536, -115.13863518834114);

class LocationAddress extends StatefulWidget {
  const LocationAddress({Key? key}) : super(key: key);

  @override
  State<LocationAddress> createState() => _LocationAddressState();
}

class _LocationAddressState extends State<LocationAddress> {
  late GoogleMapController _controller;
  late LatLng initial;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    initial = initialP;

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();

    super.dispose();
  }

  List<LatLng> markers = [x0, x1, x2, x3, x4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text(
        'Find Adress',
        style: TextStyle(fontFamily: 'Ansemi'),
      )),
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
                    return GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                        },
                        onTap: (LatLng x) {},
                        markers: {
                          ...List<Marker>.generate(
                              markers.length,
                              (index) => Marker(
                                  onTap: () {
                                    print(index);
                                    _pageController.animateToPage(index,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  },
                                  markerId: MarkerId(index.toString()),
                                  position: markers[index])).toList()
                        },
                        initialCameraPosition: CameraPosition(
                          zoom: 18,
                          target: initial,
                        ));
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
                          prefix: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'asset/images/payments/2.svg',
                              color: kcgrey5,
                            ),
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
                      MasterButton(
                          name: "Confirm",
                          onTap: () {
                            Navigator.pop(context);
                          })
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
                  MasterButton(
                      name: "Confirm",
                      onTap: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

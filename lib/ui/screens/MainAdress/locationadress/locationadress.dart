import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAddress extends StatefulWidget {
  const LocationAddress({Key? key}) : super(key: key);

  @override
  State<LocationAddress> createState() => _LocationAddressState();
}

class _LocationAddressState extends State<LocationAddress> {
  late GoogleMapController _controller;
  late LatLng initial;
  late PageController _pageController;
  fetchData() async {
    var x = await Geolocator.getCurrentPosition();
    initial = LatLng(x.latitude, x.longitude);
    setState(() {});
  }

  @override
  void initState() {
    _pageController = PageController();
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text(
        'Find Address',
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
                          Marker(
                              onTap: () {},
                              markerId: MarkerId(initial.toString()),
                              position: initial)
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
                              color: kcblack, fontFamily: "Anreg"),
                          prefix: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'asset/images/payments/2.svg',
                              color: kcblack,
                            ),
                          ),
                          filledColor: kcgrey3),
                      ksv20,
                      TxtField(
                          hint: "Add details",
                          hintstyle: const TextStyle(
                              color: kcBlack, fontFamily: "Anreg"),
                          prefix: const Icon(MyFlutterApp.add, color: kcblack),
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

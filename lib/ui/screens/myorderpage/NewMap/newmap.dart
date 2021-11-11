import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'New_map_compo/order_tracking_tile.dart';

var x0 = const LatLng(36.169814362090236, -115.13886921107769);
var x1 = const LatLng(36.16926546409543, -115.13927288353443);
var x2 = const LatLng(36.1692895528948, -115.13781309127806);
var x3 = const LatLng(36.16869084930472, -115.13815138489008);
var x4 = const LatLng(36.16902890627915, -115.13848900794983);
var initialP = const LatLng(36.168956639618536, -115.13863518834114);

class DemoMap extends StatefulWidget {
  const DemoMap({Key? key, this.icon}) : super(key: key);
  final BitmapDescriptor? icon;

  @override
  _DemoMapState createState() => _DemoMapState();
}

class _DemoMapState extends State<DemoMap> {
  late LatLng initial;
  late BitmapDescriptor? icon;
  late GoogleMapController _controller;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    initial = initialP;
    // WidgetsBinding.instance?.addPersistentFrameCallback((timeStamp) {
    //   initial = initialP;
    //   // setTheIcon();
    //   mounted ? setState(() {}) : () {};
    // });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();

    super.dispose();
  }

  Completer<GoogleMapController> _completerController = Completer();

  Future<void> _goToSaloon(LatLng position) async {
    final GoogleMapController controller = await _completerController.future;
    final CameraPosition _saloonPosition =
        CameraPosition(target: position, zoom: 18);
    controller.animateCamera(CameraUpdate.newCameraPosition(_saloonPosition));
  }

  // setTheIcon() async {
  //   icon = await BitmapDescriptor.fromAssetImage(
  //       const ImageConfiguration(devicePixelRatio: 2.0),
  //       'asset/images/location/pin.png');
  // }

  List<LatLng> markers = [x0, x1, x2, x3, x4];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          onTap: (LatLng x) {
            print(x);
          },
          markers: {
            ...List<Marker>.generate(
                markers.length,
                (index) => Marker(
                    onTap: () {
                      print(index);
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    },
                    markerId: MarkerId(index.toString()),
                    position: markers[index])).toList()
          },
          initialCameraPosition: CameraPosition(
            zoom: 18,
            target: initial,
          ),
        ),
        SizedBox(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: OrderTrackingTile()),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: OrderTrackingTile()),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: OrderTrackingTile()),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: OrderTrackingTile()),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: OrderTrackingTile()),
              ],
            )),
      ],
    );
  }
}

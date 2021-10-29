import 'package:frontend/Helpers/mlib.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

// class MyLocation extends BaseViewModel {
//   late LatLng _latLng;
//   Future<LatLng> getTheCurrentLocation() async {
//     Position myCurrentPosition =
//         await GeolocatorPlatform.instance.getCurrentPosition();
//     LatLng _thePosition =
//         LatLng(myCurrentPosition.latitude, myCurrentPosition.longitude);
//     _latLng = _thePosition;
//     print(_latLng);
//     return _thePosition;
//   }

//   LatLng get locate => _latLng;
// }

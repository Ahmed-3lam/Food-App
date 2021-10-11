// import 'package:flutter/material.dart';
// import 'package:frontend/Helpers/mlib.dart';
// import 'package:frontend/main.dart';
// import 'package:frontend/services/my_flutter_app_icons.dart';
// import 'package:frontend/services/routes.dart';
// import 'package:frontend/ui/constants/colors.dart';
// import 'package:frontend/ui/screens/myorderpage/myorder.dart';
// import 'package:frontend/ui/screens/profile/profilescren.dart';
// import 'package:frontend/ui/screens/savedpage/savedpage.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> with RouteAware {
//   @override
//   void didChangeDependencies() {
//     obs.subscribe(this, ModalRoute.of(context) as PageRoute);
//     super.didChangeDependencies();
//   }

//   int tappedIndex = 0;
//   _callbackSetter(int i, BuildContext context,
//       {required Widget page, required String name}) {
//     tappedIndex = i;
//     setState(() {});
//     Navigator.pushNamed(context, name);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           BottomItem(
//             tap: () {
//               _callbackSetter(0, context,
//                   page: const Home(), name: RoutesName.home);
//             },
//             shouldHighlight: ModalRoute.of(context)!.settings.name.toString() ==
//                 RoutesName.home,
//             data: MyFlutterApp.home,
//             name: "Home",
//           ),
//           BottomItem(
//             tap: () {
//               _callbackSetter(1, context,
//                   page: const MyOrderPage(), name: RoutesName.myorder);
//             },
//             shouldHighlight: ModalRoute.of(context)!.settings.name.toString() ==
//                 RoutesName.myorder,
//             data: (MyFlutterApp.listpad),
//             name: "My Order",
//           ),
//           BottomItem(
//             tap: () {
//               _callbackSetter(2, context,
//                   page: const SavedPage(), name: RoutesName.saved);
//             },
//             shouldHighlight: ModalRoute.of(context)!.settings.name.toString() ==
//                 RoutesName.saved,
//             data: (MyFlutterApp.love),
//             name: "Saved",
//           ),
//           BottomItem(
//             tap: () {
//               _callbackSetter(3, context,
//                   page: const ProfileScreen(), name: RoutesName.user);
//             },
//             shouldHighlight: ModalRoute.of(context)!.settings.name.toString() ==
//                 RoutesName.user,
//             data: (MyFlutterApp.user),
//             name: "Profile",
//           ),
//         ],
//       ),
//       height: 60,
//       width: MediaQuery.of(context).size.width,
//       decoration: const BoxDecoration(
//         color: kcwhite,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//     );
//   }
// }

// class BottomItem extends StatelessWidget {
//   const BottomItem({
//     Key? key,
//     required this.name,
//     required this.data,
//     required this.shouldHighlight,
//     required this.tap,
//   }) : super(key: key);

//   final String name;
//   final VoidCallback tap;
//   final IconData data;

//   final bool shouldHighlight;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: tap,
//       child: SizedBox(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               data,
//               color: shouldHighlight ? kcred : kcgrey5,
//             ),
//             Text(name,
//                 style: TextStyle(
//                   color: shouldHighlight ? kcred : kcgrey5,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

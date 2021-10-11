// import 'package:frontend/Helpers/mlib.dart';

// import 'payment/compo.dart/mycard.dart';
// import 'payment/compo.dart/paymethodtile.dart';

// class ChoosePaymentMethod extends StatefulWidget {
//   const ChoosePaymentMethod({Key? key}) : super(key: key);

//   @override
//   State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
// }

// class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
//   late PageController _pageController;
//   final String payPath = "asset/payment/";
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: .9);
//   }

//   int currenPage = 0;
//   int cardselect = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: comanAppBar(context, "Choose Payment"),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: kpaddinghor20,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ksv20,
//                   const FoodText.ktsAnsemi(
//                     "Cash",
//                     fonsize: 16,
//                   ),
//                   ksv16,
//                   const Divider(
//                     color: kcdivider,
//                     thickness: 3,
//                     height: 1,
//                   ),
//                   SizedBox(
//                       height: 60,
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             "asset/images/payments/viscard.png",
//                             scale: 5,
//                           ),
//                           ksh30,
//                           const FoodText("**** **** **** 9314")
//                         ],
//                       )),
//                   ksv10,
//                   SizedBox(
//                     height: 20,
//                     child: MaterialButton(
//                       padding: EdgeInsets.zero,
//                       onPressed: () {},
//                       child: const FoodText.ktsAnreg(
//                         "+ Add new card",
//                         color: kcred,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ksv18,
//             SizedBox(
//               height: 191,
//               child: PageView.builder(
//                 onPageChanged: (page) {
//                   currenPage = page;
//                   setState(() {});
//                 },
//                 controller: _pageController,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 2,
//                 itemBuilder: (BuildContext context, int index) {
//                   return AnimatedPadding(
//                     curve: Curves.linearToEaseOut,
//                     duration: const Duration(milliseconds: 800),
//                     padding: index != currenPage
//                         ? const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 5)
//                         : const EdgeInsets.symmetric(horizontal: 5),
//                     child: MyCard(
//                         isItaddcard: false,
//                         index: !index.isOdd ? 0 : 1,
//                         name: cards[index].name.toUpperCase(),
//                         id: cards[index].id.toUpperCase(),
//                         exp: "10/24"),
//                   );
//                 },
//               ),
//             ),
//             ksv18,
//             PayMethod(
//                 ontap: () {
//                   setState(() {
//                     cardselect = 1;
//                   });
//                 },
//                 isselected: cardselect == 1,
//                 name: "Paypal",
//                 mail: "Mypaypal@gmail.com",
//                 asset: "paypal"),
//             ksv10,
//             PayMethod(
//                 ontap: () {
//                   setState(() {
//                     cardselect = 2;
//                   });
//                 },
//                 isselected: cardselect == 2,
//                 name: "Cash On Delivery",
//                 mail: "Pay in cash",
//                 asset: "not"),
//             ksv10,
//             PayMethod(
//                 ontap: () {
//                   setState(() {
//                     cardselect = 3;
//                   });
//                 },
//                 isselected: cardselect == 3,
//                 name: "Apple Pay",
//                 mail: "applepay.com",
//                 asset: "apple"),
//             ksv30,
//           ],
//         ),
//       ),
//     );
//   }
// }

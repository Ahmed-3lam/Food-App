import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:frontend/ui/screens/intro/intro.dart';

import 'Helpers/mlib.dart';
import 'repositary/historymodelrepo.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
      ),
      home: const Intor(),
    );
  }
}

class MyBooking extends StatelessWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      ksv12,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyBookingTiel(
          image: histrory[2].image,
          name: histrory[2].name,
          date: histrory[2].date,
          isCancelled: histrory[2].isCancelled,
        ),
      )
    ])));
  }
}

class MyBookingTiel extends StatelessWidget {
  const MyBookingTiel({
    Key? key,
    required this.isCancelled,
    required this.name,
    required this.image,
    required this.date,
  }) : super(key: key);
  final bool isCancelled;
  final String name, image, date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: kcwhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 7,
                    color: kcTransparent.withOpacity(.26))
              ]),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          image,
                          scale: 3,
                        ),
                      ),
                      ksh16,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          FoodText.ktsAnsemi(
                            'S&L Diner',
                            fonsize: 18,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          FoodText(
                            'Maharana Pratap Nagar, Bhopal',
                            style: ktsAnreg,
                            fonsize: 15,
                            color: Colors.black,
                            weight: FontWeight.w400,
                            // color: kctxtcolor,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ))
                    ],
                  ),
                  ksv20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodText.ktsAnsemi(
                            'Date',
                            fonsize: 16,
                            color: kcblack.withOpacity(.70),
                          ),
                          Text(
                            'October 10, 2021 at 4.30 PM',
                            style: ktsAnreg.copyWith(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                      ksh12,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodText.ktsAnsemi(
                            'Guest',
                            fonsize: 16,
                            color: kcblack.withOpacity(.70),
                          ),
                          Text(
                            '2',
                            style: ktsAnreg.copyWith(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                      ksv12,
                    ],
                  ),
                  ksv12,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodText.ktsAnsemi(
                            'Booking By',
                            fonsize: 16,
                            color: kcblack.withOpacity(.70),
                          ),
                          Text(
                            "Zack Foster",
                            style: ktsAnreg.copyWith(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                      ksh12,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodText.ktsAnsemi(
                            'Booking  No.',
                            fonsize: 16,
                            color: kcblack.withOpacity(.70),
                          ),
                          Text(
                            '#S10000000001',
                            style: ktsAnreg.copyWith(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                      ksv12,
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      isCancelled
                          ? const SizedBox()
                          : SizedBox(
                              width: 70,
                              child: MasterButton(
                                  radii: 10,
                                  textcolor: kcpurpel,
                                  isOutlined: true,
                                  name: "Call",
                                  onTap: () {},
                                  height: 30,
                                  buttonColor: kcpurpel),
                            ),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        child: MasterButton(
                          radii: 10,
                          textcolor: kcred,
                          isOutlined: true,
                          name: "Cancel",
                          onTap: () {},
                          height: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              CircleAvatar(
                radius: 15,
                child: Icon(
                  isCancelled ? Icons.close : Icons.done,
                  size: 18,
                ),
                backgroundColor: isCancelled ? kcblack : kcred,
                foregroundColor: kcwhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}

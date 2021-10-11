import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/Helpers/mlib.dart';

import 'compo/driverreviewtextfield.dart';

class DriverReviewDialogue extends StatelessWidget {
  DriverReviewDialogue({
    Key? key,
  }) : super(key: key);
  final List<int> chooseintrests = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
            child: GestureDetector(
      onTap: () {
        Navigator.pop(context, true);
      },
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 13, bottom: 20, left: 20, right: 20),
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    height: 424,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kcwhite,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      children: [
                        const FoodText.ktsAnsemi(
                          "Rate Driver",
                          fonsize: 16,
                          weight: FontWeight.w300,
                        ),
                        ksv8,
                        Image.asset(
                          "asset/images/home/x.png",
                          scale: 3,
                        ),
                        ksv6,
                        const FoodText("Michel Clerk", fonsize: 14),
                        ksv16,
                        RatingBar.builder(
                            unratedColor: kcdivider,
                            itemSize: 30,
                            itemBuilder: (context, i) => const Icon(
                                  MyFlutterApp.star,
                                  color: kcGolden,
                                ),
                            onRatingUpdate: (i) {}),
                        ksv8,
                        SizedBox(
                          height: 40,
                          child: Row(children: [
                            MasterToggleButton(
                              name: "Punctual",
                              tap: () {
                                if (!chooseintrests.contains(1)) {
                                  chooseintrests.add(1);
                                } else {
                                  chooseintrests.remove(1);
                                }
                              },
                            ),
                            ksh8,
                            MasterToggleButton(
                              name: "service",
                              tap: () {
                                if (!chooseintrests.contains(2)) {
                                  chooseintrests.add(2);
                                } else {
                                  chooseintrests.remove(2);
                                }
                              },
                            ),
                            ksh8,
                            MasterToggleButton(
                              name: "Clean",
                              tap: () {
                                if (!chooseintrests.contains(3)) {
                                  chooseintrests.add(3);
                                } else {
                                  chooseintrests.remove(3);
                                }
                              },
                            ),
                          ]),
                        ),
                        ksv8,
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              MasterToggleButton(
                                name: "Careful",
                                tap: () {
                                  if (!chooseintrests.contains(4)) {
                                    chooseintrests.add(4);
                                  } else {
                                    chooseintrests.remove(4);
                                  }
                                },
                              ),
                              ksh8,
                              MasterToggleButton(
                                name: "Hard Working",
                                tap: () {
                                  if (!chooseintrests.contains(5)) {
                                    chooseintrests.add(5);
                                  } else {
                                    chooseintrests.remove(5);
                                  }
                                },
                              ),
                              ksh8,
                              ksh8,
                            ],
                          ),
                        ),
                        ksv16,
                        DialouGeTextFiel(
                          hint: "Leave a review",
                          maxLines: 2,
                          hintstyle: ktsAnsemi.copyWith(fontSize: 11),
                        ),
                        ksv8,
                        Row(
                          children: [
                            GestureDetector(
                                child: const FoodText.ktsAnsemi("Cancel"),
                                onTap: () {
                                  Navigator.pop(context);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/driverreviewdialouge/compo/groupedbuttons.dart';

import 'compo/driverreviewtextfield.dart';

class DriverReviewDialogue extends StatelessWidget {
  DriverReviewDialogue({
    Key? key,
  }) : super(key: key);
  final List<int> chooseintrests = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 13, bottom: 20, left: 20, right: 20),
          margin: const EdgeInsets.only(left: 12, right: 12),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kcwhite, borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              const FoodText.ktsAnsemi(
                "Rate Driver",
                fontSize: 16,
                weight: FontWeight.w300,
              ),
              ksv8,
              SizedBox(
                height: 78,
                width: 78,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(39),
                  child: Image.asset(
                    'asset/images/PlaceHolder/placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ksv6,
              const FoodText("Michel Clerk", fontSize: 14),
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
              CustomButtonWrapper(
                buttons: feedBack,
                blank: [],
                valueTeller: (value, values) {},
                onTap: () {},
                isRadio: false,
              ),
              ksv12,
              DialouGeTextFiel(
                hint: "Leave a review",
                maxLines: 2,
                hintstyle: ktsAnsemi.copyWith(fontSize: 11),
              ),
              ksv8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    child: MaterialButton(
                        padding: EdgeInsets.zero,
                        child: const FoodText.ktsAnsemi("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    height: 20,
                    child: MaterialButton(
                        padding: EdgeInsets.zero,
                        child: const FoodText("Submit",
                            color: kcOrange, weight: FontWeight.bold),
                        onPressed: () {
                          RouteX.popToTheTop(context);
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

List<String> feedBack = <String>[
  'Punctual',
  'Good Service',
  'Clean',
  'HardWorking',
  'Careful'
];

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/services/my_flutter_app_icons.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/textstyles.dart';

class DetailsReviewComment extends StatelessWidget {
  const DetailsReviewComment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                "asset/images/PlaceHolder/placeholder.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const FoodText(
                    "MaryJane Cook",
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  const Spacer(),
                  RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: 5,
                      itemSize: 20,
                      itemBuilder: (context, i) => const Icon(
                            MyFlutterApp.star,
                            color: kcGolden,
                            size: 20,
                          ),
                      onRatingUpdate: (r) {})
                ],
              ),
              const FoodText(
                '2nd Oct,2019',
                color: kctxtcolor,
                style: TextStyle(),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Really easy and the family loved it.They don't normally like it when wine added so this went down a treat. Followed to the letter!",
                style: TextStyle(
                    color: kcblack, fontFamily: "Anreg", fontSize: 15),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

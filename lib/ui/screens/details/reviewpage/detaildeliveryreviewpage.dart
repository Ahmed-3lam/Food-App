import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/paddings.dart';
import 'package:frontend/ui/constants/textstyles.dart';
import 'package:frontend/ui/screens/details/reviewpage/compo/detailreviewcoment.dart';
import 'package:frontend/ui/screens/details/reviewpage/compo/detailreviewrating.dart';

class DetailReviewPage extends StatelessWidget {
  const DetailReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kpadding,
            child: const FoodText(
              "Photos & Videos",
              fonsize: 22,
              color: kcblack,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 101,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) => Padding(
                      padding:
                          EdgeInsets.only(right: 20, left: i == 0 ? 20 : 0),
                      child: SizedBox(
                          height: 101,
                          width: 101,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.asset(dishes[i].image,
                                  fit: BoxFit.cover))),
                    )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 17,
                ),
                FoodText(
                  "Reviews",
                  fonsize: 22,
                ),
                SizedBox(
                  height: 15,
                ),
                DetailsReview(),
                SizedBox(
                  height: 25,
                ),
                DetailsReviewComent(),
                DetailsReviewComent(),
                DetailsReviewComent(),
                DetailsReviewComent(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

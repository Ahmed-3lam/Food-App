import 'package:flutter/material.dart';
import 'ratingDialog.dart';

class RateDialog extends StatelessWidget {
  const RateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
        initialRating: 5,
        commentHint: "Write review in 30 words",
        message: "Let's rate what is your test about the dish.",
        image: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("asset/images/PlaceHolder/placeholder.jpg"),
        ),
        title: 'Rate The Dish',
        submitButton: 'Submit',
        onSubmitted: (v) {});
  }
}

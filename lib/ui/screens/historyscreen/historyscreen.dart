import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/historymodelrepo.dart';
import 'package:frontend/ui/screens/Dialogs/commondialog.dart';
import 'package:frontend/ui/screens/orderfailed/orderdetails.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kpadding,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: histrory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Historytiel(
                      image: histrory[index].image,
                      name: histrory[index].name,
                      date: histrory[index].date,
                      isCancelled: histrory[index].isCancelled,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Historytiel extends StatelessWidget {
  const Historytiel({
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
      onTap: () {
        RouteX.sliderRighToLeft(context, const OrderFailed());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 121,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.asset(
                      image,
                      scale: 3,
                    ),
                  ),
                  ksh16,
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodText.ktsAnsemi(
                          name,
                          fonsize: 16,
                        ),
                        FoodText.ktsAnreg(
                          date,
                          fonsize: 13,
                          // color: kctxtcolor,
                        ),
                        const FoodText.ktsAnreg(
                          "\$150-Item-Cash",
                          fonsize: 13,
                        ),
                        const SizedBox(
                          height: 4,
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
                                        name: "Rate",
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  RatingDialog(
                                                      initialRating: 5,
                                                      commentHint:
                                                          "Write review in 30 words",
                                                      message:
                                                          "Let's rate what is your test about the dish.",
                                                      image: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.asset(
                                                            'asset/images/resturant/res2.jpg'),
                                                      ),
                                                      title: 'Rate The Dish',
                                                      submitButton: 'Submit',
                                                      onSubmitted: (v) {}));
                                        },
                                        height: 30,
                                        buttonColor: kcpurpel),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              child: MasterButton(
                                radii: 10,
                                textcolor: kcred,
                                isOutlined: true,
                                name: "Re-Order",
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            backgroundColor: kcTransparent,
                                            child: CommonDialog(
                                                tittle: 'Reorder',
                                                subTittle:
                                                    'On tap reorder your order will place and then you can track your order and contact driver',
                                                buttonText: 'ReOrder',
                                                dialogThemeColor:
                                                    const Color(0xff22A45D),
                                                avatarChild: const Icon(
                                                  Icons.done,
                                                  color: kcwhite,
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                }),
                                          ));
                                },
                                height: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
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

class RatingDialog extends StatelessWidget {
  /// The dialog's title
  final String title;

  /// The dialog's message/description text
  final String? message;

  /// The top image used for the dialog to be displayed
  final Widget? image;

  /// The rating bar (star icon & glow) color
  final Color ratingColor;

  /// Disables the cancel button and forces the user to leave a rating
  final bool force;

  /// The initial rating of the rating bar
  final int initialRating;

  /// Display comment input area
  final bool enableComment;

  /// The comment's TextField hint text
  final String commentHint;

  /// The submit button's label/text
  final String submitButton;

  /// Returns a RatingDialogResponse with user's rating and comment values
  final Function(RatingDialogResponse) onSubmitted;

  /// called when user cancels/closes the dialog
  final Function? onCancelled;

  const RatingDialog({
    required this.title,
    this.message,
    this.image,
    required this.submitButton,
    required this.onSubmitted,
    this.ratingColor = Colors.amber,
    this.onCancelled,
    this.force = false,
    this.initialRating = 1,
    this.enableComment = true,
    this.commentHint = 'Tell us your comments',
  });

  @override
  Widget build(BuildContext context) {
    final _commentController = TextEditingController();
    final _response = RatingDialogResponse(rating: initialRating);

    final _content = Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                image != null
                    ? Padding(
                        child: image,
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                      )
                    : Container(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Master',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                message != null
                    ? Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Master',
                            fontWeight: FontWeight.w600),
                      )
                    : Container(),
                const SizedBox(height: 10),
                Center(
                  child: RatingBar.builder(
                    initialRating: initialRating.toDouble(),
                    glowColor: ratingColor,
                    minRating: 1.0,
                    itemSize: 30,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) =>
                        _response.rating = rating.toInt(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: ratingColor,
                    ),
                  ),
                ),
                enableComment
                    ? TextField(
                        controller: _commentController,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.newline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: commentHint,
                        ),
                      )
                    : const SizedBox(height: 15),
                TextButton(
                  child: Text(
                    submitButton,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: kcred),
                  ),
                  onPressed: () {
                    if (!force) Navigator.pop(context);
                    _response.comment = _commentController.text;
                    onSubmitted.call(_response);
                  },
                ),
              ],
            ),
          ),
        ),
        if (!force && onCancelled != null) ...[
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              Navigator.pop(context);
              onCancelled!.call();
            },
          )
        ]
      ],
    );

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      titlePadding: EdgeInsets.zero,
      scrollable: true,
      title: _content,
    );
  }
}

class RatingDialogResponse {
  /// The user's comment response
  String comment = '';

  /// The user's rating response
  int rating;

  RatingDialogResponse({this.rating = 1});
}

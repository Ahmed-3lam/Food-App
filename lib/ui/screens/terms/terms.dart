import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/comancontainerpage/comancontainerizedpage.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComanContaineraziedPag(
        children: childSpacer([
          const TermsText(
              titel: "General site usage last revised\nDecember 12-01-2020.",
              desc:
                  "Welcome to www.saydulmoon.info. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure."),
          const TermsText(
              titel: "1. Agreement",
              desc:
                  "Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure."),
          const TermsText(
              titel: "2. Account",
              desc:
                  "Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure."),
          const TermsText(
              titel: "3. Relation With Groceries",
              desc:
                  "Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.")
        ], 15),
        appbarTitel: "Terms & Condition");
  }
}

class TermsText extends StatelessWidget {
  const TermsText({
    Key? key,
    required this.titel,
    required this.desc,
  }) : super(key: key);
  final String titel, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titel,
          style: ktsAnsemi,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          desc,
          style: ktsAnsemi,
        )
      ],
    );
  }
}

List<Widget> childSpacer(List<Widget> childrens, int size) {
  List<Widget> spacerlist = <Widget>[];

  for (Widget child in childrens) {
    spacerlist.add(child);
    spacerlist.add(const SizedBox(
      height: 15,
    ));
  }

  return spacerlist;
}

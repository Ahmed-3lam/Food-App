import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/comancontainerpage/comancontainerizedpage.dart';

class Faqs extends StatelessWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ComanContaineraziedPag(children: [
      FaqTile(
        titel: "1. How it will take to delivery?",
        sub:
            "In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.",
      ),
      FaqTile(
        titel: "2. What is refund system?",
        sub:
            "In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.\n\nIn enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.\n\nIn enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.",
      ),
    ], appbarTitel: "FAQs");
  }
}

class FaqTile extends StatelessWidget {
  const FaqTile({
    Key? key,
    required this.titel,
    required this.sub,
  }) : super(key: key);
  final String titel, sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titel,
          style: ktsAnsemi.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 25 * .85,
        ),
        Text(
          sub,
          style: ktsAnsemi,
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

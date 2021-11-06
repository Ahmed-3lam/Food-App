import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/utils/textutlities.dart';

import 'data.dart';

class CommonIntoPage extends StatelessWidget {
  const CommonIntoPage({
    Key? key,
    required this.model,
  }) : super(key: key);
  final IntroModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              model.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        ksv16,
        Text(
          model.data,
          textAlign: TextAlign.center,
          style:
              FontStyleUtilities.h3(fontWeight: FWT.bold, fontColor: kcwhite),
        ),
        ksv30,
      ],
    );
  }
}

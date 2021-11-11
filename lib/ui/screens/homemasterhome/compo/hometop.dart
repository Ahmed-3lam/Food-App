import 'package:flutter/material.dart';
import 'package:frontend/Helpers/mlib.dart';

import 'header.dart';
import 'homecarousel.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Container(
            height: 427,
            decoration: const BoxDecoration(
              color: kcred,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  65,
                ),
              ),
            ),
          ),
          Column(
            children: const [
              SizedBox(
                height: 44,
              ),
              HomeHeader(),
              SizedBox(
                height: 20,
              ),
              HomeCarousel(),
            ],
          )
        ],
      ),
    );
  }
}

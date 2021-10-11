import 'package:flutter/material.dart';

class RouteX {
  RouteX._();
  static sliderRighToLeft(BuildContext context, Widget page,
      {bool? isPushreplacement = false}) {
    isPushreplacement!
        ? Navigator.of(context, rootNavigator: true).push(PageRouteBuilder(
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: page)))
        : Navigator.of(context).push(PageRouteBuilder(
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: page)));

    // PageRouteBuilder(
    //   reverseTransitionDuration: const Duration(milliseconds: 500),
    //   transitionDuration: const Duration(milliseconds: 500),
    //   pageBuilder: (context, anim1, anim2) => SlideTransition(
    //     position:
    //         Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
    //             .animate(CurvedAnimation(
    //                 parent: anim1, curve: Curves.linearToEaseOut)),
    //     child: page,
    //   ),
    // ),
    // );
  }

  static sliderLeftToRight(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, anim1, anim2) => SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: anim1, curve: Curves.linearToEaseOut)),
          child: page,
        ),
      ),
    );
  }

  static sliderTopToBottom(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, anim1, anim2) => SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: anim1, curve: Curves.linearToEaseOut)),
          child: page,
        ),
      ),
    );
  }

  static sliderBottomToTop(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, anim1, anim2) => SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: anim1, curve: Curves.linearToEaseOut)),
          child: page,
        ),
      ),
    );
  }
}

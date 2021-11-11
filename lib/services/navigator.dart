import 'package:flutter/material.dart';
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';

///WE CAN SHORT THIS CLASS BY THE MAKING A SWITCH CASE FUNCTION BUT
///LOOKS LIKE WE HAVE TO REFACTOR ALL CODE AND IT IS TIME CONSUMING...
class RouteX {
  RouteX._();
  static sliderRighToLeft(BuildContext context, Widget page,
      {bool? isPushreplacement = false, bool? shouldMaintain = true}) {
    isPushreplacement!
        ? Navigator.of(context, rootNavigator: true).push(PageRouteBuilder(
            maintainState: shouldMaintain!,
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: page)))
        : Navigator.of(context).push(PageRouteBuilder(
            maintainState: shouldMaintain!,
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: page)));

    ///WE HAVE COMMENTED THIS BECAUSE WE USED THE FUNCTION SLIDE RIGHT TO LEFT ALL
    ///OVER SO BY REPLACING THIS THE PAGE TRANSITION USED IN THE ALL OVER PROJECT
    ///WILL BE CHANGED...

    /// PageRouteBuilder(
    ///   reverseTransitionDuration: const Duration(milliseconds: 500),
    ///   transitionDuration: const Duration(milliseconds: 500),
    ///   pageBuilder: (context, anim1, anim2) => SlideTransition(
    ///     position:
    ///         Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
    ///             .animate(CurvedAnimation(
    ///                 parent: anim1, curve: Curves.linearToEaseOut)),
    ///     child: page,
    ///   ),
    /// );
    /// ),
  }

  static getToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: const MainHome())),
        (route) => false);
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

  static popToTheTop(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: const MainHome())),
        (route) => false);
  }
}

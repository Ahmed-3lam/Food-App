import 'package:flutter/material.dart';
import 'package:frontend/ui/screens/User_controll/profile/profilescren.dart';
import 'package:frontend/ui/screens/homemasterhome/homemasterhome.dart';
import 'package:frontend/ui/screens/Home_main/home_main.dart';
import 'package:frontend/ui/screens/myorderpage/myorder.dart';
import 'package:frontend/ui/screens/preauth/intro/intro.dart';
import 'package:frontend/ui/screens/savedpage/savedpage.dart';
import 'package:frontend/ui/screens/searchCopy/searchcopy.dart';
import 'package:frontend/ui/screens/searchfiltercopy/searchfiltercopy.dart';

Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => const HomeMasterHome(),
  RoutesName.user: (context) => const ProfileScreen(),
  RoutesName.saved: (context) => const SavedPage(),
  RoutesName.myorder: (context) => const MyOrderPage(),
  // RoutesName.mytab: (context) => const Tabbing(),
  RoutesName.intro: (context) => const Intro(),
  RoutesName.stackBar: (context) => const MainHome(),
  '/searchcopy': (context) => const SearchCopy(),
  '/searchfiltercopy': (context) => const SearchFilterCopy(),
};

class RoutesName {
  static String stackBar = "/home";
  static String intro = '/intr';
  static String home = '/';
  static String user = '/user';
  static String saved = '/saved';
  static String myorder = '/order';
  // static String mytab = "/tab";
}

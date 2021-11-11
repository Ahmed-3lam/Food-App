import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/preauth/intro/intro.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
      ),
      home: const Intro(),
    );
  }
}

class RevealScreen extends StatelessWidget {
  const RevealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.asset('asset/images/illustration/1.png')],
      ),
    );
  }
}


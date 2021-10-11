import 'package:flutter/material.dart';

class MyICondeButton extends StatelessWidget {
  const MyICondeButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.height = 20,
  }) : super(key: key);
  final Widget icon;
  final double? height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: icon,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

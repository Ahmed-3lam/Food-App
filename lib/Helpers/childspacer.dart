import 'package:flutter/material.dart';

List<Widget> childSpacer(List<Widget> children, double height) {
  List<Widget> spacedChild = <Widget>[];
  for (Widget child in children) {
    spacedChild.add(child);
    spacedChild.add(SizedBox(
      height: height,
    ));
  }
  return spacedChild;
}

import 'package:flutter/material.dart';

List<Widget> childSpacer(List<Widget> children, double height,
    {bool isvertical = false}) {
  List<Widget> spacedChild = [];

  for (Widget child in children) {
    spacedChild.add(child);
    isvertical
        ? spacedChild.add(SizedBox(height: height))
        : spacedChild.add(SizedBox(width: height));
  }
  return spacedChild;
}

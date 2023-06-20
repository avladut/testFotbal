import 'package:flutter/material.dart';
import 'package:fotbal_project/presentation/screens/home_page.dart';
import 'package:fotbal_project/utils/locator.dart';

void main() {
  setupLocator();
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

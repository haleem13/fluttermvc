import 'package:flutter/material.dart';

class CustomNavigator {
  static nextScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return screen;
        },
      ),
    );
  }
}

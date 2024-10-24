import 'package:flutter/material.dart';
import 'profile_factory.dart';

class LoginRouter {
  static void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePageFactory.create()),
    );
  }
}

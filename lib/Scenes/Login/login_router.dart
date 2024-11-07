import 'package:designsystemsampleapp/Scenes/Profile/profile.dart';
import 'package:flutter/material.dart';
import '../Login/login_factory.dart'; // Certifique-se de importar o LoginFactory

class LoginRouter {
  static void goToProfilePage(
      BuildContext context, Map<String, dynamic> userData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(userData: userData),
      ),
    );
  }

  static void goToLoginPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create()),
      (route) => false, // Limpa toda a pilha de navegação
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/Scenes/Profile/profile_factory.dart';
import '../Login/login_factory.dart'; // Certifique-se de importar o LoginFactory

class LoginRouter {
  static void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePageFactory.create()),
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

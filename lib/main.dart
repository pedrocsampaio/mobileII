import 'package:flutter/material.dart';
import 'DesignSystem/Views/Login/login.dart';  // Adicione a referência para a sua tela de login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),  // A tela que você quer rodar
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'DesignSystem/Views/Login/login.dart'; // Importe a página de login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Define a LoginPage como a tela inicial
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DesignSystem/views/login/login.dart'; // Substitua pelo caminho correto
import 'DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart'; // Se você estiver usando o ActionButtonViewModel

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ActionButtonViewModel>(
          create: (_) => ActionButtonViewModel(
            style:
                ActionButtonStyle.primary, // Defina o estilo inicial do botão
            size: ActionButtonSize.large, // Defina o tamanho inicial do botão
            text: 'Sign Up', // Defina o texto inicial do botão
          ),
        ),
      ],
      child: MaterialApp(
        home: SignupScreen(), // Defina sua tela de login como inicial
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../Components/InputField/input_text_view_model.dart'; // Seu arquivo de view models
import '../../Components/InputField/input_text.dart'; // Seu widget de input customizado
import '../../Components/LinkedLabel/linked_label.dart'; // ViewModel para LinkedLabel
import '../../Components/LinkedLabel/linked_label_view_model.dart'; // Widget LinkedLabel

class LoginPage extends StatelessWidget {
  final InputTextViewModel emailViewModel;
  final InputTextViewModel passwordViewModel;

  LoginPage({
    Key? key,
  })  : emailViewModel = InputTextViewModel(
          controller: TextEditingController(),
          placeholder: 'E-mail',
          password: false,
        ),
        passwordViewModel = InputTextViewModel(
          controller: TextEditingController(),
          placeholder: 'Password',
          password: true,
        ),
        super(key: key);

  void _navigateToTerms(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TermsPage()), // Chama a página de termos
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagem no topo
            Image.asset(
              'assets/logo.png', // Substitua pelo caminho da sua imagem
              height: 100,
            ),
            const SizedBox(height: 40),

            // Campo de E-mail
            StyledInputField.instantiate(viewModel: emailViewModel),
            const SizedBox(height: 16),

            // Campo de Senha
            StyledInputField.instantiate(viewModel: passwordViewModel),
            const SizedBox(height: 24),

            // Botão de Login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Ação do botão de login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Cor amarela
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox "Permanecer logado" e LinkedLabel
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Alinha os elementos à esquerda
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Alinha verticalmente no centro
              children: [
                Checkbox(
                  value:
                      false, // Valor inicial, pode ser modificado conforme necessidade
                  onChanged: (bool? value) {
                    // Ação ao marcar/desmarcar o checkbox
                  },
                ),
                const SizedBox(
                    width:
                        8), // Adiciona um pequeno espaçamento entre o checkbox e o texto
                Expanded(
                  child: LinkedLabel.instantiate(
                    viewModel: LinkedLabelViewModel(
                      fullText: "I have read and agree to the Terms & Services",
                      linkedText: "Terms & Services",
                      onLinkTap: () => _navigateToTerms(
                          context), // Navega para a página de termos
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Services'),
      ),
      body: const Center(
        child: Text('Aqui estão os termos e serviços.'),
      ),
    );
  }
}

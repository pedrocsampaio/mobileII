import '../../DesignSystem/Components/InputField/input_text.dart';
import '../../DesignSystem/Components/InputField/input_text_view_model.dart';
import '../../DesignSystem/Components/LinkedLabel/linked_label.dart';
import '../../DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/LoadingButton/loading_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/LoadingButton/loading_button_view_model.dart';
import 'package:flutter/material.dart';
import 'login_service.dart';
import 'login_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void _login() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Chama o serviço de login e aguarda a resposta
      Map<String, dynamic> userData = await LoginService.fetchLogin(
        emailController.text,
        passwordController.text,
      );

      // Se o login for bem-sucedido, navega para a página de perfil com os dados do usuário
      LoginRouter.goToProfilePage(context, userData);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Campo de Email
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: emailController,
                placeholder: 'Email',
                password: false,
              ),
            ),
            const SizedBox(height: 20),

            // Campo de Senha
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
              ),
            ),
            const SizedBox(height: 20),

            // Checkbox e Termos de Serviço
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                LinkedLabel.instantiate(
                  viewModel: LinkedLabelViewModel(
                    fullText: 'I agree with Terms and Services',
                    linkedText: 'Terms and Services',
                    onLinkTap: () {
                      // Ação ao clicar no "terms and services"
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Botão de Login com Loading
            LoadingButton(
              viewModel: LoadingButtonViewModel(
                text: 'Login',
                isLoading: isLoading,
                onPressed: _login,
              ),
            ),
            const SizedBox(height: 20),

            // Texto "Don't Have An Account?"
            const Center(
              child: Text(
                "Don't Have An Account?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Botão Sign Up
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Ação de sign up
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8D247),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

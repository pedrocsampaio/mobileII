import 'package:flutter/material.dart';
import 'login_service.dart';
import 'login_router.dart';
import '../../DesignSystem/Components/InputField/input_text.dart';
import '../../DesignSystem/Components/InputField/input_text_view_model.dart';
import '../../DesignSystem/Components/LinkedLabel/linked_label.dart';
import '../../DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

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
                      // Ação ao clicar nos "terms and services"
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Botão de Login principal
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    // Chama o método fetchLogin
                    Map<String, dynamic> userData =
                        await LoginService.fetchLogin(
                      emailController.text,
                      passwordController.text,
                    );

                    // Navega para a página de perfil
                    LoginRouter.goToProfilePage(context);
                  } catch (e) {
                    // Mostra mensagem de erro
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao fazer login')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8D247),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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

            // Botão Sign up
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Ação para redirecionar ao sign up
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
            const SizedBox(height: 20),
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

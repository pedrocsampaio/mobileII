import 'package:flutter/material.dart';
import '../../Components/InputField/input_text.dart';
import '../../Components/InputField/input_text_view_model.dart'; 
import '../../Components/LinkedLabel/linked_label.dart'; 
import '../../Components/LinkedLabel/linked_label_view_model.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
     // Para que tudo ocupe a largura total
          children: [
            const SizedBox(height: 40),

            Center(
              child: Image.asset(
                'lib/DesignSystem/Views/Login/assets/login_image.png',
              ),
            ),
            const SizedBox(height: 40),

            // Campo de Email
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(),
                placeholder: 'Email',
                password: false,
              ),
            ),
            const SizedBox(height: 20),

            // Campo de Senha
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(),
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

            // Botão de Login principal
            SizedBox(
              height: 50,
              width: double.infinity, // Ocupa toda a largura
              child: ElevatedButton(
                onPressed: () {
                  // Ação de login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8D247), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Texto "Already Have An Account?"
            const Center(
              child: Text(
                "Already Have An Account?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Botão Login abaixo do texto
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Ação de login
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
          ],
        ),
      ),
    );
  }
}


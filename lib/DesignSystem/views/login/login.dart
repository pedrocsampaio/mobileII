import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Components/InputText/input_text.dart';
import '../../Components/InputText/input_text_view_model.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InputTextViewModel>(
          create: (_) => InputTextViewModel(),
        ),
        ChangeNotifierProvider<ActionButtonViewModel>(
          create: (_) => ActionButtonViewModel(
            text: 'Signup',
            size: ActionButtonSize.large,
            style: ActionButtonStyle.primary,
          ),
        ),
      ],
      child: MaterialApp(
        home: SignupScreen(),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inputViewModel = Provider.of<InputTextViewModel>(context);
    final actionButtonViewModel = Provider.of<ActionButtonViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),

            // Placeholder for profile image
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
            ),

            SizedBox(height: 40),

            // Input for E-mail
            InputText.instantiate(viewModel: inputViewModel),

            SizedBox(height: 20),

            // Input for Password
            InputText.instantiate(viewModel: inputViewModel),

            SizedBox(height: 20),

            // Checkbox for Terms & Services
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('I have read and agree '),
                TextButton(
                  onPressed: () {},
                  child: Text('Terms & Services',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Signup Button
            Center(
              child: ActionButton.instantiate(viewModel: actionButtonViewModel),
            ),

            SizedBox(height: 20),

            // Already have an account? Login
            Center(
              child: Column(
                children: [
                  Text('Already Have An Account?'),
                  SizedBox(height: 10),
                  ActionButton.instantiate(
                    viewModel: ActionButtonViewModel(
                      text: 'Login',
                      size: ActionButtonSize.medium,
                      style: ActionButtonStyle.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

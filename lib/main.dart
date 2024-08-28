import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DesignSystem/Components/InputText/input_text.dart';
import 'DesignSystem/Components/InputText/input_text_view_model.dart';
import 'DesignSystem/Components/InputText/input_text_disabled.dart';
import 'DesignSystem/Components/InputText/input_text_disabled_view_model.dart';
import 'DesignSystem/Components/InputText/input_text_error.dart';
import 'DesignSystem/Components/InputText/input_text_error_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('MVVM Input Text Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ChangeNotifierProvider<InputTextViewModel>(
                create: (_) => InputTextViewModel(),
                child: InputTextField(viewModel: InputTextViewModel()),
              ),
              SizedBox(height: 20),
              ChangeNotifierProvider<InputTextDisabledViewModel>(
                create: (_) => InputTextDisabledViewModel(),
                child: InputTextFieldDisabled(viewModel: InputTextDisabledViewModel()),
              ),
              SizedBox(height: 20),
              ChangeNotifierProvider<InputTextErrorViewModel>(
                create: (_) => InputTextErrorViewModel(),
                child: InputTextFieldError(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

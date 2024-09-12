import 'package:flutter/material.dart';
import 'package:mobille/DesignSystem/Samples/input_text_sample_screen.dart';
import 'package:provider/provider.dart';
import 'DesignSystem/Components/InputText/input_text.dart';
import 'DesignSystem/Components/InputText/input_text_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('MVVM Input Text Example'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                final inputTextViewModel = Provider.of<InputTextViewModel>(context);
                return InputText.instantiate(viewModel: inputTextViewModel);
              },
            ),
          ),
        ),
      ),
    );
  }
}




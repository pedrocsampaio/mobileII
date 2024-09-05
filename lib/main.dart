import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DesignSystem/Components/InputText/input_text.dart';
import 'DesignSystem/Components/InputText/input_text_view_model.dart';
import 'DesignSystem/Components/InputText/input_text_disabled.dart';
import 'DesignSystem/Components/InputText/input_text_disabled_view_model.dart';
import 'DesignSystem/Components/InputText/input_text_error.dart';
import 'DesignSystem/Components/InputText/input_text_error_view_model.dart';
import 'package:mobille/DesignSystem/Components/TabBar/navigation_bottom_bar.dart';
import 'package:mobille/DesignSystem/Components/TabBar/navigation_bottom_bar_view_model.dart';

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
        ChangeNotifierProvider<InputTextDisabledViewModel>(
          create: (_) => InputTextDisabledViewModel(),
        ),
        ChangeNotifierProvider<InputTextErrorViewModel>(
          create: (_) => InputTextErrorViewModel(),
        ),
        ChangeNotifierProvider<NavigationBottomBarViewModel>(
          create: (_) => NavigationBottomBarViewModel(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('MVVM Input Text Example')),
          // O conteúdo do corpo será a página correspondente à tab selecionada
          body: Consumer<NavigationBottomBarViewModel>(
            builder: (context, viewModel, child) {
              return viewModel.currentPage;
            },
          ),
          bottomNavigationBar: NavigationBottomBar(),
        ),
      ),
    );
  }
}
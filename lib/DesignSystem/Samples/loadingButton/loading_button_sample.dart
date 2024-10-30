import 'package:flutter/material.dart';
import '../../Components/Buttons/LoadingButton/loading_button.dart';
import '../../Components/Buttons/LoadingButton/loading_button_view_model.dart';

class LoadingButtonSample extends StatefulWidget {
  const LoadingButtonSample({Key? key}) : super(key: key);

  @override
  State<LoadingButtonSample> createState() => _LoadingButtonSampleState();
}

class _LoadingButtonSampleState extends State<LoadingButtonSample> {
  bool isLoading = false;

  void toggleLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      // Ação ao finalizar o loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingButton(
          viewModel: LoadingButtonViewModel(
            text: 'Login',
            isLoading: isLoading,
            onPressed: toggleLoading,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputTextViewModel {
  final TextEditingController controller = TextEditingController();
  String labelText;
  String hintText;

  InputTextViewModel({
    this.labelText = "Digite",
    this.hintText = "",
  });

  void onChanged(String value) {
    // Lógica ao mudar o valor do input
    print("Input value changed: $value");
  }

  String getText() {
    return controller.text;
  }

  void dispose() {
    controller.dispose();
  }
}

import 'package:flutter/material.dart';

// Enum para os tamanhos do botão
enum ActionButtonSize {
  large,
  medium,
  small,
}

// Enum para os estilos do botão
enum ActionButtonStyle {
  primary,
  secondary,
  tertiary,
}

// Classe ViewModel que estende ChangeNotifier
class ActionButtonViewModel extends ChangeNotifier {
  ActionButtonStyle style;
  ActionButtonSize size;
  String text;
  Image? image;

  ActionButtonViewModel({
    required this.style,
    required this.size,
    required this.text,
    this.image,
  });

  // Exemplo de método para modificar o estado e notificar os ouvintes
  void updateText(String newText) {
    text = newText;
    notifyListeners();
  }

  // Exemplo de método para alterar o estilo
  void updateStyle(ActionButtonStyle newStyle) {
    style = newStyle;
    notifyListeners();
  }
}

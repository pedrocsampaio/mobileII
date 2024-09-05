import 'package:flutter/material.dart';

class LinkedLabelViewModel extends ChangeNotifier {
  // Função que será executada quando o link for clicado
  void onLinkTap() {
    print('Link clicked!'); // Aqui você pode definir qualquer lógica adicional, como navegação.
    // notifyListeners(); // Caso você precise atualizar o estado.
  }
}

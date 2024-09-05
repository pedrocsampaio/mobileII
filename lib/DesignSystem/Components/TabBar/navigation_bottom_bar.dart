import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_bottom_bar_view_model.dart';

class NavigationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NavigationBottomBarViewModel>(context);

    return BottomNavigationBar(
      currentIndex: viewModel.selectedIndex,
      onTap: (index) => viewModel.changeIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: _buildCustomIcon(),
          label: 'label',
        ),
        BottomNavigationBarItem(
          icon: _buildCustomIcon(),
          label: 'label',
        ),
        BottomNavigationBarItem(
          icon: _buildCustomIcon(),
          label: 'label',
        ),
      ],
    );
  }

  // Função para criar o ícone personalizado
  Widget _buildCustomIcon() {
    return Container(
      width: 40, // Largura do quadrado
      height: 40, // Altura do quadrado
      decoration: BoxDecoration(
        color: Colors.black, // Cor de fundo do ícone
        borderRadius: BorderRadius.circular(8), // Borda arredondada
      ),
      child: Center(
        child: Text(
          '24',
          style: TextStyle(
            color: Colors.white, // Cor do número
            fontSize: 20, // Tamanho do número
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

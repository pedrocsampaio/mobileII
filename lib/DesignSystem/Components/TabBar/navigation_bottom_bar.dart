import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_bottom_bar_view_model.dart';

class NavigationBottomBar extends StatelessWidget {
  final NavigationBottomBarViewModel viewModel;

  const NavigationBottomBar._(this.viewModel);

  static Widget instantiate({required NavigationBottomBarViewModel viewModel}) {
    return ChangeNotifierProvider<NavigationBottomBarViewModel>.value(
      value: viewModel,
      child: NavigationBottomBar._(viewModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NavigationBottomBarViewModel>(context);

    return BottomNavigationBar(
      currentIndex: viewModel.selectedIndex,
      onTap: (index) => viewModel.changeIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: _buildCustomIcon(),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildCustomIcon(),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: _buildCustomIcon(),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildCustomIcon() {
    return Container(
      width: 40, 
      height: 40, 
      decoration: BoxDecoration(
        color: Colors.black, 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '24',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

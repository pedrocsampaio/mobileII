import 'package:flutter/material.dart';

class NavigationBottomBarViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Lista de páginas que correspondem às tabs
  List<Widget> pages = [
    Center(child: Text('Label')),
    Center(child: Text('Label')),
    Center(child: Text('Label')),
  ];

  Widget get currentPage => pages[_selectedIndex];
}

import 'package:flutter/material.dart';

class LoadingButtonViewModel {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color loadingColor;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;

  LoadingButtonViewModel({
    required this.text,
    required this.isLoading,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFF8D247),
    this.textColor = Colors.black,
    this.loadingColor = Colors.white,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 30,
    this.fontSize = 16,
  });
}

import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/LoadingButton/loading_button_view_model.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final LoadingButtonViewModel viewModel;

  const LoadingButton({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: viewModel.height,
      width: viewModel.width,
      child: ElevatedButton(
        onPressed: viewModel.isLoading ? null : viewModel.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: viewModel.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(viewModel.borderRadius),
          ),
        ),
        child: viewModel.isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: viewModel.loadingColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                viewModel.text,
                style: TextStyle(
                  color: viewModel.textColor,
                  fontSize: viewModel.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'linked_label_view_model.dart';

class LinkedLabel extends StatelessWidget {
  final String fullText;
  final String linkedText;

  const LinkedLabel({
    Key? key,
    required this.fullText,
    required this.linkedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LinkedLabelViewModel>(context);

    final linkStartIndex = fullText.indexOf(linkedText);
    final linkEndIndex = linkStartIndex + linkedText.length;

    if (linkStartIndex == -1) {
      return Text(fullText); // Se o texto do link não for encontrado
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: fullText.substring(0, linkStartIndex),
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: linkedText,
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = viewModel.onLinkTap,
          ),
          TextSpan(
            text: fullText.substring(linkEndIndex),
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void showAlertDialog(
    {required BuildContext context,
    required Widget title,
    required Widget content}) {
  showDialog<Widget>(
      context: context,
      builder: (_) => AlertDialog(
            title: title,
            content: content,
          ));
}

void showSimpleDialog(
    {required BuildContext context,
    required Widget title,
    required Widget content,
    VoidCallback? onClosed}) {
  showDialog<Widget>(
      context: context,
      builder: (_) => SimpleDialog(
            title: title,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: content,
              )
            ],
          )).then((value) {
    if (onClosed != null) {
      onClosed();
    }
  });
}

void showQuestionDialog(
    {required BuildContext context,
    required Widget title,
    required VoidCallback yesPressed,
    required VoidCallback noPressed}) {
  showSimpleDialog(
    context: context,
    title: title,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
            onPressed: () {
              yesPressed();
              Navigator.of(context).pop();
            },
            child: const Text('はい')),
        const SizedBox(
          width: 20,
        ),
        OutlinedButton(
            onPressed: () {
              noPressed();
              Navigator.of(context).pop();
            },
            child: const Text('いいえ')),
      ],
    ),
  );
}
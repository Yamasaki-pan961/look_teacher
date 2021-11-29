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

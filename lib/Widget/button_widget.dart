import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainButton(buttonName: 'S'),
        MainButton(buttonName: 'M'),
        MainButton(buttonName: 'E'),
        MainButton(buttonName: 'C')
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  MainButton({required this.buttonName});

  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log('pressed$buttonName');
      },
      child: Text(buttonName),
    );
  }
}

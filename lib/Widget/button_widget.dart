import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MainButton(buttonName: 'S'),
        MainButton(buttonName: 'M'),
        MainButton(buttonName: 'E'),
        MainButton(buttonName: 'C')
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({required this.buttonName, Key? key}) : super(key: key);
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

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectClassScreen extends StatelessWidget {
  const SelectClassScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クラス選択'),
      ),
      body: Center(
        child: Column(
          children: const [
            ClassButton(className: 'S'),
            ClassButton(className: 'M'),
            ClassButton(className: 'E'),
            ClassButton(className: 'C')
          ],
        ),
      ),
    );
  }
}

class ClassButton extends StatelessWidget {
  const ClassButton({Key? key, required this.className}) : super(key: key);
  final String className;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        log('Pressed $className');
      },
      child: Text(className),
    );
  }
}

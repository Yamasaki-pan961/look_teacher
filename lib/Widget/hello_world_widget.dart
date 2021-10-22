import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Yoko extends StatelessWidget {
  const Yoko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            log('pressed S');
          },
          child: const Text(
            'S',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            log('pressed M');
          },
          child: const Text(
            'M',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            log('pressed E');
          },
          child: const Text(
            'E',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            log('pressed C');
          },
          child: const Text(
            'C',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

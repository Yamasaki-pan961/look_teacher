import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MainButton(buttonName: 'S'),
        MainButton(buttonName: 'M'),
        MainButton(buttonName: 'E'),
        MainButton(buttonName: 'C'),
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
        Navigator.push(
          context,
        MaterialPageRoute<Widget>(builder: (context) => NextPage()));
        log('pressed$buttonName');
      },
      child: Text(buttonName),
    );
  }
}

class NextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text("はい"),
      ),
        body:Container(
          color: Colors.red,
        ));
  }

}
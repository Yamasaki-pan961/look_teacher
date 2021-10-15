import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloWorldWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Hello World', style: TextStyle(fontSize: 50),),
        StyledTextWidget(text1: 'a', text2: null,),
        StyledTextWidget(text1: 'b',)
      ],
    );
  }

}

class StyledTextWidget extends StatelessWidget{
  StyledTextWidget({required this.text1, this.text2});

  final String text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Text(text1.toString(),
    style: TextStyle(fontSize: 50, color: Colors.yellow,
    )  
    );
      }
}
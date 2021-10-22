import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class yoko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [ElevatedButton(onPressed: () {}, child: Text("S",style: TextStyle(
        color:Colors.white,
        fontSize: 20.0
    ),),),
    ElevatedButton(onPressed: () {}, child: Text("M",style: TextStyle(
        color:Colors.white,
        fontSize: 20.0
    ),),),
    ElevatedButton(onPressed: () {}, child: Text("E",style: TextStyle(
        color:Colors.white,
        fontSize: 20.0
    ),),),
    ElevatedButton(onPressed: () {}, child: Text("C",style: TextStyle(
        color:Colors.white,
        fontSize: 20.0
    ),),),
      ],
    );
  }
}

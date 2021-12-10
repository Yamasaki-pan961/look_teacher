import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SchoolNameChangeScreen extends HookWidget {
  const SchoolNameChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
       appBar: AppBar(
         title: const Text('学校名の変更'),
         centerTitle: true,
       ),
       body: Padding(
         padding:const EdgeInsets.all(20),
         child: Center(
           child: 
             Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
               TextField(
                 decoration: const InputDecoration(
                   hintText:'Enter a new school name'
                 ),
               ),
               ElevatedButton(
                 onPressed: (){}, 
                 child: const Text('変更')
                 )
                ])),
          ),
        );
  }
}
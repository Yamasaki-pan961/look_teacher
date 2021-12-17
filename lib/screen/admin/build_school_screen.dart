import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BuildSchoolScreen extends HookWidget {
  const BuildSchoolScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('学校の作成'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                
                TextFormField(
                    decoration: const InputDecoration(hintText: '学校名を入力')),
              CreateSchoolButton(buttonName: '登録'),]),
            ),
            
          ),
        ));
  }
}

class CreateSchoolButton extends HookWidget {
  const CreateSchoolButton({Key? key, required this.buttonName})
      : super(key: key);
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("登録"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MakeUserScreen extends HookWidget {
  const MakeUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー登録'),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                )
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                )
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter the password again',
                )
              ),
              ElevatedButton(
                onPressed:(){},
                child: const Text('登録'),
              )
            ]
           )
          ),
        ),
      )
    );
  }
}

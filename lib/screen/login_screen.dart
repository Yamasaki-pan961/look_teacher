import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザーログイン'),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
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
              ElevatedButton(
                onPressed:(){},
                child: const Text('ログイン'),
              )
            ]
           )
          ),
        ),
      )
    );
  }
}

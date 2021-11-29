import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final invisiblePassword = useState<bool>(true);
    final email = useState<String>('');
    final password = useState<String>('');
    return Scaffold(
        appBar: AppBar(
          title: const Text('ユーザーログイン'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
                key: _loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z\A-Z\-@._\0-9]')),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value != null && value != '') {
                        if (!EmailValidator.validate(value)) {
                          return '不正なアドレス';
                        }
                      } else {
                        return 'メールアドレスを入力してください';
                      }
                    },
                    onChanged: (value) {
                      email.value = value;
                    },
                  ),
                  TextFormField(
                    obscureText: invisiblePassword.value,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(invisiblePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          invisiblePassword.value = !invisiblePassword.value;
                        },
                      ),
                    ),
                    onChanged: (value) {
                      password.value = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_loginFormKey.currentState?.validate() ?? false) {
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.value, password: password.value);
                          if (userCredential.user != null) {
                            Navigator.of(context).pop();
                          }
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(e.code)));
                        }
                      }
                    },
                    child: const Text('ログイン'),
                  )
                ])),
          ),
        ));
  }
}

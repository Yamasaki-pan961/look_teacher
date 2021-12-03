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
    // データを保持するStateを作成。Stateはリビルドされても値を保持する。普通の変数はリビルド時に初期化が動く
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
              // formの動作を制御するためのkeyを設定する。Formでkeyを登録するとFormFieldをまとめて制御できて便利
                key: _loginFormKey,
                // 入力規則が守られているかチェックする（validate）のモード設定。入力があるたびチェックするモード
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    // 入力制限の追加
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z\A-Z\-@._\0-9]')),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    // 入力のチェック
                    validator: (value) {
                      if (value != null && value != '') {
                        if (!EmailValidator.validate(value)) {
                          return '不正なアドレス';
                        }
                      } else {
                        return 'メールアドレスを入力してください';
                      }
                    },
                    // 入力があったとき値をStateに格納
                    onChanged: (value) {
                      email.value = value;
                    },
                  ),
                  TextFormField(
                    // パスワードの表示設定
                    obscureText: invisiblePassword.value,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      // パスワードの表示設定を変更するボタンをTextFieldFormの中に作る
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

                      // Form内のすべてのFormFieldが入力チェックを通過したかを調べる
                      if (_loginFormKey.currentState?.validate() ?? false) {
                        try {

                          // ログイン処理
                          final userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.value, password: password.value);

                          if (userCredential.user != null) {
                            Navigator.of(context).pop();
                          }
                        } on FirebaseAuthException catch (e) {

                          // エラー時スナックバーを表示
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

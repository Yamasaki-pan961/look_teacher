import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

class MakeUserScreen extends HookWidget {
  MakeUserScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final invisiblePassword = useState<bool>(true);
    final invisiblePasswordAgain = useState<bool>(true);
    final email = useState<String>('');
    final password = useState<String>('');
    final passwordAgain = useState<String>('');
    return Scaffold(
        appBar: AppBar(
          title: const Text('ユーザー登録'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z\A-Z\-@._\0-9]')),
                    ],
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
                    validator: (value) {
                      if (value != null) {
                        if (value.length < 8) {
                          return '8文字以上を入力してください';
                        }
                      } else {
                        return 'パスワードを入力してください';
                      }
                    },
                  ),
                  const Text('使用可能文字: A~Z a~z 0~9 @ - _ .'),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z\A-Z\-@._\0-9]')),
                    ],
                    obscureText: invisiblePasswordAgain.value,
                    decoration: InputDecoration(
                      hintText: 'Enter your password again',
                      suffixIcon: IconButton(
                        icon: Icon(invisiblePasswordAgain.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          invisiblePasswordAgain.value =
                              !invisiblePasswordAgain.value;
                        },
                      ),
                    ),
                    onChanged: (value) {
                      passwordAgain.value = value;
                    },
                    validator: (value) {
                      if (password.value != value) {
                        return 'パスワードが一致しません';
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          // FireAuthにアカウントを登録する
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email.value, password: password.value);
                          if (userCredential.user != null) {
                            // メールアドレスに認証URLを送信
                            await userCredential.user!.sendEmailVerification();

                            // FirestoreにUserごとのドキュメントを作成
                            await TeacherCRUDController().setRecord(
                                userCredential.user!.uid,
                                TeacherUserModel(uid: userCredential.user!.uid),
                                null);
                            Navigator.of(context).pop();
                          }
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(e.code)));
                        }
                      }
                    },
                    child: const Text('登録'),
                  )
                ])),
          ),
        ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/common/show_dialog.dart';

class EmailVerifiedScreen extends HookWidget {
  const EmailVerifiedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showAlertDialog(
            context: context,
            title: const Text('ログアウトしますか？'),
            content: Row(children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('しない'),
              ),
              MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  while (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('ログアウト'),
              )
            ]));

        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('確認用メールが届いています。認証してください。'),
              MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser?.reload();
                },
                child: const Text('メール確認完了'),
              ),
              MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser
                      ?.sendEmailVerification();
                },
                child: const Text('確認メールの再送信'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/common/show_dialog.dart';

// メールの確認ができていない時に表示される画面
class EmailVerifiedScreen extends HookWidget {
  const EmailVerifiedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // 画面遷移時に処理を追加できるwidget
    return WillPopScope(
      
      // 画面から遷移するときログアウトしなければ遷移できないように設定
      onWillPop: () async {
        
        // ログアウトするかダイアログを表示
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

                  // ログアウトボタンを押すとログアウトする
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

                  // FireAuthのUserのプロファイルを変更しても自動で更新されないため、更新をかける
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

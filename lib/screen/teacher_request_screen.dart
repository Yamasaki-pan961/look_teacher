import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TeacherRequestScreen extends HookWidget {
  const TeacherRequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final requestMessage = useState<String>('');
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録申請'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            obscureText: false,
            decoration: const InputDecoration(
              hintText: 'メッセージを入力',
            ),
            onChanged: (text) {
              requestMessage.value = text;
            },
          ),
          ElevatedButton(
            child: const Text('送信'),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}

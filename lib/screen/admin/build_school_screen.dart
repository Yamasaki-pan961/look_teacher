import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/create_school.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';

class BuildSchoolScreen extends HookWidget {
  const BuildSchoolScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final inputState = useState<String>('');
    final teacher = useProvider(currentTeacherProvider).state;
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
                    decoration: const InputDecoration(hintText: '学校名を入力'),
                    onChanged: (value) {
                      inputState.value = value;
                    }),
                ElevatedButton(
                  onPressed: () {
                    createSchool(
                        schoolName: inputState.value, teacher: teacher!);
                  },
                  child: const Text('登録'),
                ),
              ]),
            ),
          ),
        ));
  }
}

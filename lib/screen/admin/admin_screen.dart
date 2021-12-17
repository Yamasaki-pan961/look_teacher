import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';

class AdminScreen extends HookWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminSchool = useProvider(teacherSchoolProvider).state;
    if (adminSchool != null) {
      final editSchoolNameScreen = Container();
      final adminTeacherScreen = Container();
      final adminDeviceScreen = Container();
      return Scaffold(
        appBar: AppBar(
          title: const Text('学校管理画面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                child: const Text('名前の変更'),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('教員の管理'),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('デバイスの管理'),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

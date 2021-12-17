import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class UserProfileScreen extends HookWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacher = useProvider(currentTeacherProvider).state;
    final schoolMap = useProvider(schoolMapProvider).state;
    final editTeacherProfileScreen = Container();
    if (teacher != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ユーザープロファイル'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push<Widget>(MaterialPageRoute(
                    builder: (context) => editTeacherProfileScreen));
              },
              child: const Text('編集'),
            )
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: columnList(context, teacher, schoolMap ?? {}))),
      );
    }
    return Container();
  }

  List<Widget> columnList(BuildContext context, TeacherUserModel teacher,
      Map<String, String> schoolMap) {
    final list = <Widget>[
      Text('名前：${teacher.name}'),
      Text('所属学校：${schoolMap[teacher.schoolId]}'),
      Text('Bluetoothスキャンの有効：${teacher.isEnableBluetooth}'),
      Text('お知らせ：${teacher.notifications}'),
    ];
    return list;
  }
}

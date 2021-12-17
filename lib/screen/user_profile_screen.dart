import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/screen/bluetooth_screen.dart';

class UserProfileScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final teacher = useProvider(currentTeacherProvider).state;
    if (teacher != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('ユーザープロファイル')),
        body: Column(children: columnList(context, teacher)),
      );
    }
    return Container();
  }

  List<Widget> columnList(BuildContext context, TeacherUserModel teacher) {
    final list = <Widget>[]..add(Row(
        children: [
        ],
      ));
    return list;
  }
}

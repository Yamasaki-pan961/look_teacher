import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/widget/teacher_widget.dart';

class SchoolTeachersScreen extends HookWidget {
  const SchoolTeachersScreen({Key? key, required this.teacherList})
      : super(key: key);
  final List<TeacherUserModel> teacherList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('教員一覧'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: listWidget(teacherList),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> listWidget(List<TeacherUserModel> teacherList) {
    final List<Widget> teacherWidget = [];
    for (final teacher in teacherList) {
      teacherWidget.add(TeacherWidget(teacherUserModel: teacher));
    }
    return teacherWidget;
  }
}

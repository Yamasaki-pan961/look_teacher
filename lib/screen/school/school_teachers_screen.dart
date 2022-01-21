import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/widget/teacher_widget.dart';

class SchoolTeachersScreen extends HookWidget {
  const SchoolTeachersScreen({Key? key, required this.teacherIdList})
      : super(key: key);
  final List<String> teacherIdList;
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
              children: listWidget(teacherIdList),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> listWidget(List<String> teacherIdList) {
    final List<Widget> teacherWidget = [];
    for (final id in teacherIdList) {
      teacherWidget.add(TeacherWidget(teacherId: id,));
    }
    return teacherWidget;
  }
}

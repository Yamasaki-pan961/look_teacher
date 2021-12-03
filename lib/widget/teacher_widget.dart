import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

class TeacherWidget extends HookWidget {
  const TeacherWidget({Key? key, required this.teacherUserModel})
      : super(key: key);
  final TeacherUserModel teacherUserModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue,width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical : 10.0, horizontal: 20.0),
        
        child: Column(
          children: [
            Text(teacherUserModel.name),
            Text(teacherUserModel.deviceId),
            Text(teacherUserModel.schoolId),
            Text(teacherUserModel.notifications.length.toString())
          ],
        ),
      ),
    );
  }
}

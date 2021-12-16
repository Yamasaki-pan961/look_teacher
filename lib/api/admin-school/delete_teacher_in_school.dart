import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

Future<bool> deleteTeacherInSchool(
    {required TeacherUserModel teacher,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final classList = [...schoolModel.schoolClassList];
  final SchoolClassModel schoolClass = classList
      .firstWhere((element) => element.teacherIdList.contains(teacher.uid));
  final teacherIdList = [...schoolClass.teacherIdList];
  final newSchoolClass = schoolClass.copyWith(teacherIdList: teacherIdList..remove(teacher.uid));

  classList
    ..remove(schoolClass)
    ..add(newSchoolClass);
  log(classList.toString());
  try {
    await SchoolCRUDController().updateRecord(schoolModel.schoolId,
        schoolModel.copyWith(schoolClassList: classList), schoolMap);
    await TeacherCRUDController()
        .updateRecord(teacher.uid, teacher.copyWith(schoolId: ''));
    return true;
  } on FirebaseException {
    return false;
  }
}

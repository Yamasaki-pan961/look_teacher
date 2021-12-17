import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

Future<bool> editTeacherSchoolClass(
    {required TeacherUserModel teacher,
    required String className,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final classList = [...schoolModel.schoolClassList];
  final SchoolClassModel schoolClass =
      classList.firstWhere((element) => element.name == className);
  final teacherIdList = [...schoolClass.teacherIdList, teacher.uid];
  final newSchoolClass = schoolClass.copyWith(teacherIdList: teacherIdList);

  classList
    ..removeWhere((element) => element.name == className)
    ..add(newSchoolClass);
  log(classList.toString());
  try {
    await SchoolCRUDController().updateRecord(schoolModel.schoolId,
        schoolModel.copyWith(schoolClassList: classList), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> deleteClass(
    {required SchoolClassModel schoolClassModel,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final schoolClassList = [...schoolModel.schoolClassList]
    ..remove(schoolClassModel);
  final newTeacherList = [
    ...schoolClassList.first.teacherIdList,
    ...schoolClassModel.teacherIdList
  ];
  schoolClassList.first =
      schoolClassList.first.copyWith(teacherIdList: newTeacherList);
  final copySchool = schoolModel.copyWith(schoolClassList: schoolClassList);
  log(schoolModel.toString());
  log(copySchool.toString());

    try {
    await SchoolCRUDController()
        .updateRecord(schoolModel.schoolId, copySchool, schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> denialTeacher(
    {required ApplicantModel applicantModel,
    required String className,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final applicantList = [...schoolModel.applicantList]..remove(applicantModel);

  log(applicantList.toString());
  final classList = [...schoolModel.schoolClassList];
  final SchoolClassModel schoolClass =
      classList.firstWhere((element) => element.name == className);
  final teacherIdList = [
    ...schoolClass.teacherIdList,
    applicantModel.teacherId
  ];

  final newSchoolClass = schoolClass.copyWith(teacherIdList: teacherIdList);

  classList
    ..removeWhere((element) => element.name == className)
    ..remove(newSchoolClass);
  log(classList.toString());

  final copySchool = schoolModel.copyWith(applicantList: applicantList);
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

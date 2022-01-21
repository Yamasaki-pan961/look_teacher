import 'dart:developer';

import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> permitTeacher(
    {required ApplicantModel applicantModel,
    required String className,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final applicantList = [...schoolModel.applicantList]..remove(applicantModel);

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
    ..add(newSchoolClass);
  log(classList.toString());

  final copySchool = schoolModel.copyWith(
      applicantList: applicantList, schoolClassList: classList);
  log(schoolModel.toString());
  log(copySchool.toString());

  await SchoolCRUDController()
      .updateRecord(schoolModel.schoolId, copySchool, schoolMap);
  await TeacherCRUDController()
      .updateField(applicantModel.teacherId, 'schoolId', schoolModel.schoolId);

  return true;
}

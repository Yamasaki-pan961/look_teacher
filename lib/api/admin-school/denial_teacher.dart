import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> denialTeacher(
    {required ApplicantModel applicantModel,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final applicantList = [...schoolModel.applicantList]..remove(applicantModel);
  final copySchool = schoolModel.copyWith(applicantList: applicantList);
  try {
    await SchoolCRUDController()
        .updateRecord(schoolModel.schoolId, copySchool, schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

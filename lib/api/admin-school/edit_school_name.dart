import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> editSchoolName(
    {required String schoolName,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  try {
    await SchoolCRUDController().updateRecord(schoolModel.schoolId,
        schoolModel.copyWith(schoolName: schoolName), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

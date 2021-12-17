import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> editSchoolClassName(
    {required String newName,
    required SchoolClassModel currentClass,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final classList = [...schoolModel.schoolClassList]
    ..remove(currentClass)
    ..add(currentClass.copyWith(name: newName));
  try {
    await SchoolCRUDController().updateRecord(schoolModel.schoolId,
        schoolModel.copyWith(schoolClassList: classList), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

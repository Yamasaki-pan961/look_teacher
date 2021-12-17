import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> deleteSchool(
    {required SchoolModel school,
    required Map<String, String> schoolMap}) async {
  final teacherIdList = <String>[];
  try {
    for (final schoolClass in school.schoolClassList) {
      teacherIdList.addAll(schoolClass.teacherIdList);
    }
    for (final teacherId in teacherIdList) {
      await TeacherCRUDController().updateField(teacherId, 'schoolId', '');
    }
    await SchoolCRUDController().deleteRecord(school.schoolId, schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

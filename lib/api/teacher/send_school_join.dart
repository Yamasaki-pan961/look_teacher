import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

Future<bool> sendSchoolJoin(
    {required SchoolModel targetSchool,
    required String message,
    required TeacherUserModel teacher,
    required Map<String, String> schoolMap}) async {
  final applicant = ApplicantModel(teacherId: teacher.uid, message: message,teacherName: teacher.name);
  final newApplicantList = [...targetSchool.applicantList, applicant];
  try {
    await SchoolCRUDController().updateRecord(targetSchool.schoolId,
        targetSchool.copyWith(applicantList: newApplicantList), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

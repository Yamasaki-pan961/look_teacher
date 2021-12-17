import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

Future<bool> createSchool({
  required String schoolName,
  required TeacherUserModel teacher,
}) async {
  final school = SchoolModel(
    schoolName: schoolName,
    adminsId: [teacher.uid],
    schoolClassList: [
      SchoolClassModel(name: 'default', teacherIdList: [teacher.uid])
    ],
  );
  try {
    final id = await SchoolCRUDController().createRecord(school);
    await TeacherCRUDController()
        .updateRecord(teacher.uid, teacher.copyWith(schoolId: id!));
    return true;
  } on FirebaseException {
    return false;
  }
}

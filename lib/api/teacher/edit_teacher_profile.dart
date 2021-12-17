import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

Future<bool> editTeacherProfile(
    {required TeacherUserModel newTeacherProfile}) async {
  try {
    await TeacherCRUDController()
        .updateRecord(newTeacherProfile.uid, newTeacherProfile);
    return true;
  } on FirebaseException {
    return false;
  }
}

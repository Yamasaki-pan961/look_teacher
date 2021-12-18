import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

Future<bool> editTeacherSchoolClass(
    {required TeacherUserModel teacher,
    required String currentClassName,
    required String nextClassName,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final classList = [...schoolModel.schoolClassList];
  // 新しいクラスに教員を追加
  final SchoolClassModel nextSchoolClass =
      classList.firstWhere((element) => element.name == nextClassName);
  final nextTeacherIdList = [...nextSchoolClass.teacherIdList, teacher.uid];
  final newNextSchoolClass =
      nextSchoolClass.copyWith(teacherIdList: nextTeacherIdList);
  classList
    ..removeWhere((element) => element.name == nextClassName)
    ..add(newNextSchoolClass);

  // 前のクラスから教員を削除
  final currentSchoolClass =
      classList.firstWhere((element) => element.name == currentClassName);
  final currentTeacherIdList = [...currentSchoolClass.teacherIdList]
    ..remove(teacher.uid);
  final newCurrentSchoolClass = currentSchoolClass.copyWith(teacherIdList: currentTeacherIdList);
  classList
    ..removeWhere((element) => element.name == currentClassName)
    ..add(newCurrentSchoolClass);

  try {
    await SchoolCRUDController().updateRecord(schoolModel.schoolId,
        schoolModel.copyWith(schoolClassList: classList), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

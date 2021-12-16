import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> createSchoolClass(
    {required String className,
    required SchoolModel schoolModel,
    required Map<String, String> schoolMap}) async {
  final schoolClass = SchoolClassModel(name: className, teacherIdList: []);
  final classList = [...schoolModel.schoolClassList, schoolClass];

  try {
    await SchoolCRUDController().updateRecord(schoolModel.schoolId,
        schoolModel.copyWith(schoolClassList: classList), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

class TeacherCRUDController {
  TeacherCRUDController() {
    targetCollectionReference = FirebaseFirestore.instance.collection(targetCollectionName);
  }

  static const timeLimit = Duration(seconds: 3);
  final String targetCollectionName = 'users';
  late final CollectionReference targetCollectionReference;

  Future<void> updateRecord(String id, TeacherUserModel teacher) async {
    const crud = 'UPDATE';
    await targetCollectionReference
        .doc(id)
        .set(teacher.toMap())
        .then((value) => _logSuccess(crud))
        .catchError((Object error) => _logFailed(crud, error))
        .timeout(timeLimit, onTimeout: () {
      _logTimeout(crud);
    });
  }

  Future<void> deleteRecord(String id) async {
    const crud = 'DELETE';
    await targetCollectionReference
        .doc(id)
        .delete()
        .then((value) => _logSuccess(crud))
        .catchError((Object error) => _logFailed(crud, error))
        .timeout(timeLimit, onTimeout: () {
      _logTimeout(crud);
    });
  }

  Future<void> setRecord(String id, TeacherUserModel teacher,
      SetOptions? setOptions) async {
    const crud = 'SET';
    await targetCollectionReference
        .doc(id)
        .set(teacher.toMap(), setOptions)
        .then((value) => _logSuccess(crud))
        .catchError((Object error) => _logFailed(crud, error))
        .timeout(timeLimit, onTimeout: () {
      _logTimeout(crud);
    });
  }

  Future<void> updateField(String id, String fieldName, dynamic value) async {
    const crud = 'UPDATE FIELD';
    await targetCollectionReference
        .doc(id)
        .update({fieldName: value})
        .then((value) => _logSuccess(crud))
        .catchError((Object error) => _logFailed(crud, error))
        .timeout(timeLimit, onTimeout: () {
          _logTimeout(crud);
        });
  }

  void _logSuccess(String crud) {
    log('SUCCESS $crud in $targetCollectionName');
  }

  void _logFailed(String crud, Object error) {
    log('FAILED $crud in $targetCollectionName: $error');
  }

  void _logTimeout(String crud) {
    log('TIMEOUT $crud in $targetCollectionName');
  }
}

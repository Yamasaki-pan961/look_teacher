import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherCRUDController {
  TeacherCRUDController() {
    targetCollectionReference = FirebaseFirestore.instance.collection(targetCollectionName);
  }

  static const timeLimit = Duration(seconds: 3);
  final String targetCollectionName = 'users';
  late final CollectionReference targetCollectionReference;

  Future<String?> createRecord(
    String id,
    Map<String, dynamic> recordData
  ) async {
    const crud = 'CREATE';
    await targetCollectionReference
        .add(recordData)
        .then((DocumentReference documentReference) {
      _logSuccess(crud);
      return documentReference.id;
    }).catchError((Object error) {
      _logFailed(crud, error);
    }).timeout(timeLimit, onTimeout: () {
      _logTimeout(crud);
      return 'timeout';
    });
  }

  Future<void> updateRecord(String id, Map<String, dynamic> recordData) async {
    const crud = 'UPDATE';
    await targetCollectionReference
        .doc(id)
        .set(recordData)
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

  Future<void> setRecord(String id, Map<String, dynamic> recordData,
      SetOptions? setOptions) async {
    const crud = 'SET';
    await targetCollectionReference
        .doc(id)
        .set(recordData, setOptions)
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

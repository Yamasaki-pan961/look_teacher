import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolCRUDController {
  SchoolCRUDController() {
    targetCollectionReference =
        FirebaseFirestore.instance.collection(targetCollectionName);
  }
  static const timeLimit = Duration(seconds: 3);
  final String targetCollectionName = 'schools';
  late final CollectionReference targetCollectionReference;

  Future<String?> createRecord(
    Map<String, dynamic> recordData,
  ) async {
    const crud = 'CREATE';
    await targetCollectionReference
        .add(recordData)
        .then((DocumentReference documentReference) async {
      await targetCollectionReference.doc('schoolList').set(
          {documentReference.id: recordData['schoolName'] as String},
          SetOptions(merge: true));
      _logSuccess(crud);
      return documentReference.id;
    }).catchError((Object error) {
      _logFailed(crud, error);
    }).timeout(timeLimit, onTimeout: () {
      _logTimeout(crud);
      return 'timeout';
    });
  }

  Future<void> updateRecord(String id, Map<String, dynamic> recordData,
      Map<String, dynamic>? schoolMap) async {
    const crud = 'UPDATE';
    await targetCollectionReference
        .doc(id)
        .set(recordData)
        .then((value) async {
          if (schoolMap != null) {
            if (schoolMap.containsKey(id)) {
              schoolMap[id] = recordData['schoolName'] as String;
              await targetCollectionReference
                  .doc('schoolList')
                  .update(schoolMap);
            }
          }
          _logSuccess(crud);
        })
        .catchError((Object error) => _logFailed(crud, error))
        .timeout(timeLimit, onTimeout: () {
          _logTimeout(crud);
        });
  }

  Future<void> deleteRecord(String id, Map<String, dynamic>? schoolMap) async {
    const crud = 'DELETE';
    await targetCollectionReference
        .doc(id)
        .delete()
        .then((value) async {
          if (schoolMap != null) {
            if (schoolMap.containsKey(id)) {
              schoolMap.remove(id);
            }
            await targetCollectionReference.doc('schoolList').set(schoolMap);
          }
          _logSuccess(crud);
        })
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

// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_user_model.freezed.dart';

@freezed
class TeacherUserModel with _$TeacherUserModel {
  const factory TeacherUserModel({
    required String uid,
    @Default('') String name,
    @Default(true) bool isEnableBluetooth,
    @Default('') String deviceId,
    @Default('') String schoolId,
    required DateTime lastScanTime,
    @Default(<String>[]) List<String> notifications,
  }) = _TeacherUserModel;

  factory TeacherUserModel.fromDoc(DocumentSnapshot<Object?> doc) {
    final field = doc.data() as Map<String, dynamic>?;
    if (field != null) {
      final String uid = field['uid'] as String;
      final String name = field['name'] as String;
      final bool isEnableBluetooth = field['isEnableBluetooth'] as bool;
      final String deviceId = field['deviceId'] as String;
      final String schoolId = field['schoolId'] as String;
      final DateTime lastScanTime =
          (field['lastScanTime'] as Timestamp).toDate();
      final List<String> notifications =
          (field['notifications'] as List).cast<String>();

      return TeacherUserModel(
          uid: uid,
          name: name,
          isEnableBluetooth: isEnableBluetooth,
          deviceId: deviceId,
          schoolId: schoolId,
          notifications: notifications,
          lastScanTime: lastScanTime);
    }
    return TeacherUserModel(uid: '',lastScanTime: DateTime(1900));
  }

  const TeacherUserModel._();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'isEnableBluetooth': isEnableBluetooth,
      'deviceId': deviceId,
      'schoolId': schoolId,
      'notifications': notifications,
      'lastScanTime':lastScanTime,
    };
  }
}

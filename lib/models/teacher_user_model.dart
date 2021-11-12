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
    @Default(false) bool isAdmin,
    @Default(<String>[]) List<String> notifications,
  }) = _TeacherUserModel;

  factory TeacherUserModel.fromDoc(QueryDocumentSnapshot<Object?> doc) {
    final field = doc.data() as Map<String, dynamic>?;
    if (field != null) {
      final String uid = field['uid'] as String;
      final bool isEnableBluetooth = field['isEnableBluetooth'] as bool;
      final String deviceId = field['deviceId'] as String;
      final String schoolID = field['schoolId'] as String;
      final bool isAdmin = field['isAdmin'] as bool;
      final List<String> notifications = field['notifications'] as List<String>;

      return TeacherUserModel(
        uid: uid,
        isEnableBluetooth: isEnableBluetooth,
        deviceId: deviceId,
        schoolId: schoolID,
        isAdmin: isAdmin,
        notifications: notifications
      );
    }
    return const TeacherUserModel(uid: '');
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'isEnableBluetooth,': isEnableBluetooth,
      'deviceId': deviceId,
      'schoolId': schoolId,
      'isAdmin': isAdmin,
      'notifications': notifications
    };
  }
}

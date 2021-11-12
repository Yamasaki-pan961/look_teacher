// flutter pub run build_runner build --delete-conflicting-outputs

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
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'isEnableBluetooth,': isEnableBluetooth,
      'deviceId': deviceId,
      'schoolId': schoolId,
      'isAdmin': isAdmin,
      'notifications': notifications
    };
  }
}

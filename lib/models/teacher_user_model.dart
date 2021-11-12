// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    @Default('') String name,
    @Default(true) bool isEnableBluetooth,
    @Default('') String deviceId,
    @Default('') String schoolId,
    @Default(false) bool isAdmin,
    @Default(<String>[]) List<String> notifications,
  }) = _UserModel;
}

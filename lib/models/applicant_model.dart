// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'applicant_model.freezed.dart';

@freezed
class ApplicantModel with _$ApplicantModel {
  const factory ApplicantModel({
    @Default('') String teacherId,
    @Default('') String message,
  }) = _ApplicantModel;

  factory ApplicantModel.fromMap(Map<String, dynamic> map) {
    final String teacherId = map['teacherId'] as String;
    final String message = map['message'] as String;
    return ApplicantModel(teacherId: teacherId, message: message);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'teacherId': teacherId, 'message': message};
  }
}

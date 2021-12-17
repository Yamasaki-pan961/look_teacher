// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'applicant_model.freezed.dart';

@freezed
class ApplicantModel with _$ApplicantModel {
  const factory ApplicantModel({
    required String teacherId,
    required String message,
    required String teacherName,
  }) = _ApplicantModel;

  factory ApplicantModel.fromMap(Map<String, dynamic> map) {
    final String teacherId = map['teacherId'] as String;
    final String message = map['message'] as String;
    final String teacherName = map['teacherName'] as String;
    return ApplicantModel(
        teacherId: teacherId, message: message, teacherName: teacherName);
  }

  const ApplicantModel._();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teacherId': teacherId,
      'message': message,
      'teacherName': teacherName
    };
  }
}

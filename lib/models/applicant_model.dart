// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'applicant_model.freezed.dart';

@freezed
class ApplicantModel with _$ApplicantModel {
  const factory ApplicantModel({
    @Default('') String teacherId,
    @Default('') String message,
  }) = _ApplicantModel;
}

// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_class_model.dart';

part 'school_model.freezed.dart';

@freezed
class SchoolModel with _$SchoolModel {
  const factory SchoolModel({
    @Default('') String schoolId,
    @Default('') String adminId,
    @Default(<DeviceModel>[]) List<DeviceModel> deviceList,
    @Default(<ApplicantModel>[]) List<ApplicantModel> applicantList,
    @Default(<SchoolClassModel>[]) List<SchoolClassModel> schoolClassList,
  }) = _SchoolModel;
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolId': schoolId,
      'admin': adminId,
      'deviceList': deviceList.map((element) => element.toMap()).toList(),
      'applicantList': applicantList.map((element) => element.toMap()).toList(),
      'schoolClassList': schoolClassList.map((element) => element.toMap()).toList()
    };
  }
}

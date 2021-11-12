// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory SchoolModel.fromDoc(DocumentSnapshot<Object?> doc) {
    final field = doc.data() as Map<String, dynamic>?;
    if (field != null) {
      final String schoolId = field['schoolId'] as String;
      final String adminId = field['adminId'] as String;
      final List<DeviceModel> deviceList =
          field['deviceList'] as List<DeviceModel>;
      final List<ApplicantModel> applicantList =
          field['applicantList'] as List<ApplicantModel>;
      final List<SchoolClassModel> schoolClassList =
          field['schoolClassList'] as List<SchoolClassModel>;

      return SchoolModel(
          schoolId: schoolId,
          adminId: adminId,
          deviceList: deviceList,
          applicantList: applicantList,
          schoolClassList: schoolClassList);
    }
    return const SchoolModel();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolId': schoolId,
      'adminId': adminId,
      'deviceList': deviceList.map((element) => element.toMap()).toList(),
      'applicantList': applicantList.map((element) => element.toMap()).toList(),
      'schoolClassList':
          schoolClassList.map((element) => element.toMap()).toList()
    };
  }
}

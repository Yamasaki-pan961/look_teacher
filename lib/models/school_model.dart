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
    @Default('') String schoolName,
    @Default('') String schoolId,
    @Default(<String>[]) List<String> adminsId,
    @Default(<DeviceModel>[]) List<DeviceModel> deviceList,
    @Default(<ApplicantModel>[]) List<ApplicantModel> applicantList,
    @Default(<SchoolClassModel>[]) List<SchoolClassModel> schoolClassList,
  }) = _SchoolModel;

  factory SchoolModel.fromDoc(DocumentSnapshot<Object?> doc) {
    final field = doc.data() as Map<String, dynamic>?;
    if (field != null) {
      final String schoolName = field['schoolName'] as String;

      final String schoolId = doc.id;
      final List<String> adminsId = (field['adminsId'] as List).cast<String>();

      final deviceMapList =
          (field['deviceList'] as List).cast<Map<String, dynamic>>();
      final List<DeviceModel> deviceList =
          deviceMapList.map((e) => DeviceModel.fromMap(e)).toList();

      final applicantMapList =
          (field['applicantList'] as List).cast<Map<String, dynamic>>();
      final List<ApplicantModel> applicantList =
          applicantMapList.map((e) => ApplicantModel.fromMap(e)).toList();

      final schoolClassMapList =
          (field['schoolClassList'] as List).cast<Map<String, dynamic>>();
      final List<SchoolClassModel> schoolClassList =
          schoolClassMapList.map((e) => SchoolClassModel.fromMap(e)).toList();

      return SchoolModel(
          schoolName: schoolName,
          schoolId: schoolId,
          adminsId: adminsId,
          deviceList: deviceList,
          applicantList: applicantList,
          schoolClassList: schoolClassList);
    }
    return const SchoolModel();
  }

  const SchoolModel._();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolName':schoolName,
      'adminsId': adminsId,
      'deviceList': deviceList.map((element) => element.toMap()).toList(),
      'applicantList': applicantList.map((element) => element.toMap()).toList(),
      'schoolClassList':
          schoolClassList.map((element) => element.toMap()).toList()
    };
  }
}

import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

void main() {
  test('toMap test', () {
    final TeacherUserModel teacher = TeacherUserModel(
        uid: 'aaa',
        name: 'yuge',
        deviceId: 'device',
        notifications: <String>['iyei', 'jojo'],
        lastScanTime: DateTime(1900));
    log(teacher.toMap().toString());

    const DeviceModel device =
        DeviceModel(deviceName: '名前', deviceId: '1234', locationName: '房研究室');
    log(device.toMap().toString());

    final ApplicantModel applicant =
        ApplicantModel(teacherId: teacher.uid, message: '入れてください',teacherName: 'yuge');
    log(applicant.toMap().toString());

    final SchoolClassModel schoolClassModel =
        SchoolClassModel(name: 'EC-1', teacherIdList: [teacher.uid]);
    log(schoolClassModel.toMap().toString());

    final SchoolModel school = SchoolModel(
        schoolName: '津山高専',
        schoolId: '12345',
        schoolClassList: [schoolClassModel],
        adminsId: [teacher.uid],
        deviceList: [device],
        applicantList: [applicant]);
    log(school.toMap().toString());
  });
}

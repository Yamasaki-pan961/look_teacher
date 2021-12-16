import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

final TeacherUserModel teacher =
    TeacherUserModel(uid: 'teacher-1', lastScanTime: DateTime.now(),name: 'yuge');
const String schoolName = 'A';
const String schoolId = 'id-aaa';
const List<String> adminsId = ['yama'];
const List<DeviceModel> deviceList = [
  DeviceModel(
      deviceName: 'device1', deviceId: 'deviceId-1', locationName: 'lab')
];
const applicant1 = ApplicantModel(teacherId: 'teacher-id1', message: 'yey');
const applicant2 = ApplicantModel(teacherId: 'teacher-id2', message: 'yey2');

const List<ApplicantModel> applicantList = [applicant1, applicant2];

const teacherIdList = <String>['teacher-id1'];
const teacherIdList2 = <String>['teacher-id2'];
const SchoolClassModel defaultClass = SchoolClassModel(name: 'default');
const SchoolClassModel schoolClass = SchoolClassModel(
    name: 'class-A', teacherIdList: [...teacherIdList, ...teacherIdList2]);

const schoolClassList = [defaultClass, schoolClass];

const schoolModel = SchoolModel(
    schoolName: schoolName,
    schoolId: schoolName,
    adminsId: adminsId,
    applicantList: applicantList,
    schoolClassList: schoolClassList,
    deviceList: deviceList);

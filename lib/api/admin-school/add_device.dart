import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> addDevice(
    {required SchoolModel school,
    required DeviceModel device,
    required Map<String, String> schoolMap}) async {
  try {
    await SchoolCRUDController().updateRecord(school.schoolId,
        school.copyWith(deviceList: [...school.deviceList, device]), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

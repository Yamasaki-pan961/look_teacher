import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<bool> editDevice(
    {required DeviceModel newDevice,
    required SchoolModel school,
    required Map<String, String> schoolMap}) async {
  final targetDevice = school.deviceList
      .firstWhere((element) => element.deviceId == newDevice.deviceId);
  final newDeviceList = [...school.deviceList, newDevice]..remove(targetDevice);
  try {
    await SchoolCRUDController().updateRecord(
        school.schoolId, school.copyWith(deviceList: newDeviceList), schoolMap);
    return true;
  } on FirebaseException {
    return false;
  }
}

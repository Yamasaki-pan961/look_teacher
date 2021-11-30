import 'dart:async';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/logic/background_process.dart';
import 'package:look_teacher/logic/bluetooth_scan.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authUserStreamProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

final currentTeacherStreamProvider = StreamProvider<DocumentSnapshot?>((ref) {
  final User? user = ref.watch(authUserStreamProvider).data?.value;
  if (user != null) {
    return TeacherCRUDController()
        .targetCollectionReference
        .doc(user.uid)
        .snapshots();
  } else {
    return Stream.value(null);
  }
});

Timer? scanTimer;

final currentTeacherProvider = StateProvider<TeacherUserModel?>((ref) {
  if (scanTimer != null) {
    scanTimer!.cancel();
  }
  return ref.watch(currentTeacherStreamProvider).when<TeacherUserModel?>(
      data: (snapshot) {
        if (snapshot != null) {
          if (snapshot.exists) {
            final teacher = TeacherUserModel.fromDoc(snapshot);
            if (teacher.isEnableBluetooth) {
              scanTimer = BackgroundProcess().periodic(
                  interval: const Duration(seconds: 20),
                  function: (Timer t) async {
                    final preference = await SharedPreferences.getInstance();
                    final filterIdList =
                        preference.getStringList('filterIdList');
                    log('filterIdList: $filterIdList');
                    if (filterIdList != null) {
                      final nearestDevice =
                          await getNearestDeviceId(filterIdList);
                      if (nearestDevice != null) {
                        if (nearestDevice != teacher.deviceId) {
                          await TeacherCRUDController().setRecord(
                              teacher.uid,
                              teacher.copyWith(deviceId: nearestDevice).toMap(),
                              null);
                        }
                      }
                      await AwesomeNotifications().createNotification(
                          content: NotificationContent(
                        id: 10,
                        channelKey: 'basic_channel',
                        title: 'Scanning Result',
                        body: nearestDevice.toString(),
                        fullScreenIntent: true,
                      ));
                    } else {
                      log('filterIdList not found');
                    }
                  });
            }
            return teacher;
          }
        }
      },
      loading: () {},
      error: (object, stack) {});
});

final teacherSchoolStream = StreamProvider<DocumentSnapshot?>((ref) {
  final teacher = ref.watch(currentTeacherProvider).state;
  if (teacher != null) {
    if (teacher.schoolId != '') {
      return SchoolCRUDController()
          .targetCollectionReference
          .doc(teacher.schoolId)
          .snapshots();
    }
  }
  return Stream.value(null);
});

final teacherSchoolProvider = StateProvider<SchoolModel?>((ref) {
  final stream = ref.watch(teacherSchoolStream);
  return stream.when(
      data: (value) {
        if (value != null) {
          final school = SchoolModel.fromDoc(value);
          SharedPreferences.getInstance().then((value) {
            value.setStringList(
                'filterIdList',
                school.deviceList.map((element) {
                  return element.deviceId;
                }).toList());
          });
          return school;
        }
      },
      loading: () {},
      error: (error, stackTrace) {});
});

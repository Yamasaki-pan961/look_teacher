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

// プロバイダーは値を提供するとともに、変更があったとき、参照しているところが再構築する仕組みがある(Hook関係,Provider関係)

// FireAuthのuserに変化を監視するプロバイダー。変化がある時、参照しているところが再構築する仕組みがある
final authUserStreamProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

// 現在のuserのFirestoreのデータを監視するプロバイダー
final currentTeacherStreamProvider = StreamProvider<DocumentSnapshot?>((ref) {
  // FireAuthのuserが変化すると再構築され、読み込むデータが変化する
  final User? user = ref.watch(authUserStreamProvider).data?.value;
  if (user != null) {
    // Firestoreの現在のuserのDocumentSnapshotを返却する。
    // DocumentSnapshotはドキュメントの変化を監視する。変化があったとき、参照しているところが再構築する
    return TeacherCRUDController()
        .targetCollectionReference
        .doc(user.uid)
        .snapshots();
  } else {
    return Stream.value(null);
  }
});

// 書き換え可能な定期的な(periodic)スキャンを提供する変数
Timer? scanTimer;

// 現在のTeacherUserを監視するプロバイダー
final currentTeacherProvider = StateProvider<TeacherUserModel?>((ref) {
  if (scanTimer != null) {
    // 再構築時、scanTimerを止める
    scanTimer!.cancel();
  }
  // currentTeacherStreamProvider(DocumentSnapshot)が変化すると再構築される
  return ref.watch(currentTeacherStreamProvider).when<TeacherUserModel?>(
      data: (snapshot) {
        // DocumentSnapshotがnullかどうか
        if (snapshot != null) {
          // Firestoreにデータが存在するか
          if (snapshot.exists) {
            // 存在時

            // DocumentSnapshotからTeacherUserを生成
            final teacher = TeacherUserModel.fromDoc(snapshot);

            // Bluetoothスキャンが有効かどうか
            if (teacher.isEnableBluetooth) {
              // 有効時、スキャンタイマーを設定する

              scanTimer = BackgroundProcess().periodic(
                  // 20秒感覚で実行
                  interval: const Duration(seconds: 20),
                  function: (Timer t) async {
                    // 内部ストレージからdeviceIdListを取得
                    final preference = await SharedPreferences.getInstance();
                    final filterIdList =
                        preference.getStringList('filterIdList');
                    log('filterIdList: $filterIdList');

                    if (filterIdList != null) {
                      // filterIdListがあるとき

                      // 最も近いデバイスを取得
                      final nearestDevice =
                          await getNearestDeviceId(filterIdList);

                      if (nearestDevice != null) {
                        // 最も近いデバイスがある時
                        if (nearestDevice != teacher.deviceId) {
                          // 前回のスキャンと違うときのみFirestoreに保存
                          await TeacherCRUDController().setRecord(teacher.uid,
                              teacher.copyWith(deviceId: nearestDevice), null);
                        }
                      }

                      // スキャン結果を通知で送る
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
            // teacherを返却
            return teacher;
          }
        }
      },
      loading: () {},
      error: (object, stack) {});
});

// TeacherUserが所属するFirestoreのschoolを監視するプロバイダー
final teacherSchoolStream = StreamProvider<DocumentSnapshot?>((ref) {
  // 現在のTeacherUserが変更されると、再構築される
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

// TeacherUserのschoolを提供するプロバイダー。監視もする
final teacherSchoolProvider = StateProvider<SchoolModel?>((ref) {
  // Firestoreのschoolが変更されると再構築される
  final stream = ref.watch(teacherSchoolStream);
  return stream.when(
      data: (value) {
        if (value != null) {
          // schoolのドキュメントを取得したらSchoolModelを生成
          final school = SchoolModel.fromDoc(value);

          // schoolのdeviceListのidをローカルストレージに保存
          SharedPreferences.getInstance().then((value) {
            value.setStringList(
                'filterIdList',
                school.deviceList.map((element) {
                  return element.deviceId;
                }).toList());
          });
          // schoolを返却
          return school;
        } else {
          SharedPreferences.getInstance().then((value) {
            value.remove('filterIdList');
          });
        }
      },
      loading: () {},
      error: (error, stackTrace) {});
});

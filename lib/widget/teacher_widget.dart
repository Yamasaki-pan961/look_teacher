import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/favorite_provider.dart';

class TeacherWidget extends HookWidget {
  TeacherWidget({Key? key, required this.teacherId}) : super(key: key) {
    teacherSchoolStreamProvider = StreamProvider<DocumentSnapshot>((ref) {
      return TeacherCRUDController()
          .targetCollectionReference
          .doc(teacherId)
          .snapshots();
    });

    teacherProvider = StateProvider<TeacherUserModel?>((ref) {
      return ref.watch(teacherStreamProvider).when(
          data: (doc) {
            return TeacherUserModel.fromDoc(doc);
          },
          loading: () {},
          error: (error, stackTrace) {});
    });

    teacherSchoolStreamProvider = StreamProvider<DocumentSnapshot>((ref) {
      final schoolId = ref.watch(teacherProvider).state?.schoolId;
      return SchoolCRUDController()
          .targetCollectionReference
          .doc(schoolId)
          .snapshots();
    });
    teacherSchoolProvider = StateProvider<SchoolModel?>((ref) {
      return ref.watch(teacherSchoolStreamProvider).when(
            data: (value) {
              return SchoolModel.fromDoc(value);
            },
            loading: () {},
            error: (error, stackTrace) {},
          );
    });
  }
  final String teacherId;
  late final StreamProvider<DocumentSnapshot> teacherStreamProvider;
  late final StateProvider<TeacherUserModel?> teacherProvider;
  late final StreamProvider<DocumentSnapshot> teacherSchoolStreamProvider;
  late final StateProvider<SchoolModel?> teacherSchoolProvider;

  @override
  Widget build(BuildContext context) {
    final teacherUserModel = useProvider(teacherProvider).state;
    if (teacherUserModel != null) {
      final List<String> favoriteTeacher =
          useProvider(favoriteTeacherIdListProvider);
      bool isFavorite = false;
      isFavorite = favoriteTeacher.contains(teacherUserModel.uid);

      final SchoolModel? school = useProvider(teacherSchoolProvider).state;
      return Card(
        child: school != null
            ? ListTile(
                title: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          if (isFavorite) {
                            await context
                                .read(favoriteTeacherIdListProvider.notifier)
                                .remove([teacherUserModel.uid]);
                          } else {
                            await context
                                .read(favoriteTeacherIdListProvider.notifier)
                                .add([teacherUserModel.uid]);
                          }
                        },
                        icon: isFavorite
                            ? const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            : const Icon(Icons.star_border)),
                    Text(teacherUserModel.name),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      final locationName = () {
                        final list = school.deviceList
                            .where((element) =>
                                element.deviceId == teacherUserModel.deviceId)
                            .toList();
                        if (list.isNotEmpty) {
                          return school.deviceList
                              .firstWhere((element) =>
                                  element.deviceId == teacherUserModel.deviceId)
                              .locationName;
                        } else {
                          return '不明';
                        }
                      }();
                      return Text('場所: $locationName');
                    }),
                    Text('最終スキャン: ${teacherUserModel.lastScanTime}'),
                    Text('所属: ${school.schoolName}'),
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      );
    }
    return Container();
  }
}

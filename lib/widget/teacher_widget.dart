import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/favorite_provider.dart';

class TeacherWidget extends HookWidget {
  TeacherWidget({Key? key, required this.teacherUserModel}) : super(key: key) {
    teacherSchoolStream = StreamProvider<DocumentSnapshot>((ref) {
      return SchoolCRUDController()
          .targetCollectionReference
          .doc(teacherUserModel.schoolId)
          .snapshots();
    });
    teacherSchool = StateProvider<SchoolModel?>((ref) {
      return ref.watch(teacherSchoolStream).when(
            data: (value) {
              return SchoolModel.fromDoc(value);
            },
            loading: () {},
            error: (error, stackTrace) {},
          );
    });
  }
  final TeacherUserModel teacherUserModel;
  late final StreamProvider<DocumentSnapshot> teacherSchoolStream;
  late final StateProvider<SchoolModel?> teacherSchool;
  
  @override
  Widget build(BuildContext context) {
    final List<String> favoriteTeacher =
        useProvider(favoriteTeacherIdListProvider);
    bool isFavorite = false;
    isFavorite = favoriteTeacher.contains(teacherUserModel.uid);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () async {
                      if (isFavorite) {
                        await context
                            .read(favoriteTeacherIdListProvider.notifier)
                            .remove([teacherUserModel.uid]);
                      } else {
                        final list = favoriteTeacher..add(teacherUserModel.uid);
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
            Text(teacherUserModel.deviceId),
            Text(teacherUserModel.schoolId),
            Text(teacherUserModel.notifications.length.toString())
          ],
        ),
      ),
    );
  }
}

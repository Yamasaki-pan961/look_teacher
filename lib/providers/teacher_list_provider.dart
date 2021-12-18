import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';

final classNameState = StateProvider((ref) => '');

final _teacherIdListState = StateProvider<List<String>>((ref) {
  final school = ref.watch(teacherSchoolProvider).state;
  if (school != null) {
    final className = ref.watch(classNameState).state;
    final schoolClass = school.schoolClassList
        .firstWhere((element) => element.name == className);
    return schoolClass.teacherIdList;
  }
  return [];
});

final _teacherStreamProvider = StreamProvider((ref) {
  final List<String> teacherIdList = ref.watch(_teacherIdListState).state;
  return TeacherCRUDController()
      .targetCollectionReference
      .where('uid', whereIn: teacherIdList.isNotEmpty ? teacherIdList : ['a'])
      .snapshots();
});

final teacherListProvider = StateProvider<List<TeacherUserModel>?>((ref) {
  return ref.watch(_teacherStreamProvider).when(
        data: (snapshot) {
          final teacherList = <TeacherUserModel>[];
          for (final doc in snapshot.docs) {
            teacherList.add(TeacherUserModel.fromDoc(doc));
          }
          return teacherList;
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      );
});

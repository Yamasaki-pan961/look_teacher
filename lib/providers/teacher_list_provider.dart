import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/teacher_crud_controller.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

final teacherIdListState = StateProvider.autoDispose((ref) => <String>[]);

final _teacherStreamProvider = StreamProvider.autoDispose((ref) {
  final List<String> teacherIdList = ref.watch(teacherIdListState).state;
  return TeacherCRUDController()
      .targetCollectionReference
      .where('uid', whereIn: teacherIdList)
      .snapshots();
});

final teacherListProvider =
    StateProvider.autoDispose<List<TeacherUserModel>?>((ref) {
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

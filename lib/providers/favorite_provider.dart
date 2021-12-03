import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoriteSchoolIdListProvider =
    StateNotifierProvider<FavoriteIdListNotifier, List<String>?>(
        (ref) => FavoriteIdListNotifier(key: 'favoriteSchool'));

final favoriteTeacherIdListProvider =
    StateNotifierProvider<FavoriteIdListNotifier, List<String>?>(
        (ref) => FavoriteIdListNotifier(key: 'favoriteTeacher'));

class FavoriteIdListNotifier extends StateNotifier<List<String>?> {
  FavoriteIdListNotifier({required this.key}) : super(null) {
    List<String>? list;
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey(key)) {
        list = value.getStringList(key);
        state = list;
      }
    });
  }
  final String key;

  Future<void> setState(List<String> list) async {
    {
      if (state != list) {
        await (await SharedPreferences.getInstance()).setStringList(key, list);
        state = list;
      }
    }
  }
}

final favoriteSchoolMapProvider = StateProvider<Map<String, String>>((ref) {
  final favoriteSchoolIdList = ref.watch(favoriteSchoolIdListProvider);
  final schoolMap = ref.watch(schoolMapProvider).state;
  final favoriteSchoolMap = <String, String>{};
  if (favoriteSchoolIdList != null && schoolMap != null) {
    for (final schoolId in favoriteSchoolIdList) {
      favoriteSchoolMap.addEntries({MapEntry(schoolId, schoolMap[schoolId]!)});
    }
  }
  return favoriteSchoolMap;
});

final favoriteTeacherListProvider =
    StateProvider<List<TeacherUserModel>?>((ref) {
  final favoriteTeacherIdList = ref.watch(favoriteTeacherIdListProvider);
  if (favoriteTeacherIdList != null) {}
});

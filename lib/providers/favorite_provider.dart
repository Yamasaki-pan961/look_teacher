import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          await (await SharedPreferences.getInstance())
              .setStringList(key, list);
          state = list;
      }
    }
  }
}

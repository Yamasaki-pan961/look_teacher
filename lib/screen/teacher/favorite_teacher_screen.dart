import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/screen/school/school_teachers_screen.dart';

class FavoriteTeacherScreen extends HookWidget {
  const FavoriteTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteTeacherIdList = useProvider(favoriteTeacherIdListProvider);
    return SchoolTeachersScreen(teacherIdList: favoriteTeacherIdList);
  }
}

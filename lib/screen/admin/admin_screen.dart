import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/push_page.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/screen/admin/school_name_change_screen.dart';
import 'package:look_teacher/screen/admin/admin_teacher.dart';

class AdminScreen extends HookWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminSchool = useProvider(teacherSchoolProvider).state;
    if (adminSchool != null) {
      final editSchoolNameScreen = Container();
      const adminTeacherScreen = AdminTeacherScreen();
      final adminDeviceScreen = Container();
      return Scaffold(
        appBar: AppBar(
          title: const Text('学校管理画面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  pushPage(context, editSchoolNameScreen);
                },
                child: const Text('名前の変更'),
              ),
              MaterialButton(
                onPressed: () {
                  pushPage(context, adminTeacherScreen);
                },
                child: const Text('教員の管理'),
              ),
              MaterialButton(
                onPressed: () {
                  pushPage(context, adminDeviceScreen);
                },
                child: const Text('デバイスの管理'),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

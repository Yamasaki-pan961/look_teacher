import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/delete_school.dart';
import 'package:look_teacher/common/push_page.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/screen/admin/admin_teacher.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/admin/school_name_change_screen.dart';

class AdminScreen extends HookWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminSchool = useProvider(teacherSchoolProvider).state;
    final schoolMap = useProvider(schoolMapProvider).state;
    if (adminSchool != null && schoolMap != null) {
      const editSchoolNameScreen = SchoolNameChangeScreen();
      final adminTeacherScreen = Container();
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
              MaterialButton(
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      title: const Text('学校を削除しますか？'),
                      content: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('キャンセル'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              deleteSchool(
                                  school: adminSchool, schoolMap: schoolMap);
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                            child: const Text('削除'),
                          )
                        ],
                      ));
                },
                child: const Text('削除'),
              )
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

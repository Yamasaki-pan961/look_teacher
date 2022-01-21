import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/delete_teacher_in_school.dart';
import 'package:look_teacher/api/teacher/send_school_join.dart';
import 'package:look_teacher/common/push_page.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/school/school_teachers_screen.dart';

class SchoolClassListScreen extends HookWidget {
  const SchoolClassListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginTeacher = useProvider(currentTeacherProvider).state;
    final school = useProvider(selectedSchoolProvider).state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('クラス一覧'),
          actions: [
            if (loginTeacher != null && loginTeacher.schoolId == '')
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '参加',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            if (loginTeacher != null &&
                loginTeacher.schoolId == school?.schoolId)
              ElevatedButton(
                  onPressed: () {
                    deleteTeacherInSchool(
                        teacher: loginTeacher,
                        schoolModel: school!,
                        schoolMap: useProvider(schoolMapProvider).state!);
                  },
                  child: const Text(
                    '脱退',
                    style: TextStyle(color: Colors.red),
                  )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: SingleChildScrollView(child: Builder(builder: (context) {
              if (school != null) {
                final classList = school.schoolClassList;
                return Column(
                  children: classButtonList(classList, context),
                );
              } else {
                return const Text('クラスを作成してください');
              }
            })))));
  }

  List<Widget> classButtonList(
      List<SchoolClassModel> classList, BuildContext context) {
    final list = <Widget>[];
    for (final schoolClass in classList) {
      list.add(Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
                onPressed: () {
                  pushPage(
                      context,
                      SchoolTeachersScreen(
                          teacherIdList: schoolClass.teacherIdList));
                },
                child: Text(schoolClass.name)),
          ],
        ),
      ));
    }
    return list;
  }
}

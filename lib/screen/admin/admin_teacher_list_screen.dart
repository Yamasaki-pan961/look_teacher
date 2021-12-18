import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/delete_teacher_in_school.dart';
import 'package:look_teacher/api/admin-school/edit_teacher_school_class.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/providers/teacher_list_provider.dart';

class AdminTeacherListScreen extends HookWidget {
  const AdminTeacherListScreen({Key? key, required this.schoolClassName})
      : super(key: key);
  final String schoolClassName;

  @override
  Widget build(BuildContext context) {
    final schoolClass = useProvider(teacherSchoolProvider)
        .state!
        .schoolClassList
        .firstWhere((element) => element.name == schoolClassName);
    return Scaffold(
      appBar: AppBar(title: Text('$schoolClassNameの教員管理')),
      body: Center(
        child: SingleChildScrollView(
          child: AdminTeacherListColumn(schoolClass: schoolClass),
        ),
      ),
    );
  }
}

class AdminTeacherListColumn extends HookWidget {
  const AdminTeacherListColumn({Key? key, required this.schoolClass})
      : super(key: key);
  final SchoolClassModel schoolClass;
  @override
  Widget build(BuildContext context) {
    final teacherList = useProvider(teacherListProvider).state;
    if (teacherList != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final teacher in teacherList)
            AdminTeacherWidget(
              teacher: teacher,
              schoolClass: schoolClass,
            )
        ],
      );
    }
    return const Text('loading');
  }
}

class AdminTeacherWidget extends StatelessWidget {
  const AdminTeacherWidget(
      {Key? key, required this.teacher, required this.schoolClass})
      : super(key: key);
  final TeacherUserModel teacher;
  final SchoolClassModel schoolClass;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(teacher.name),
        onTap: () {
          showAlertDialog(
              context: context,
              title: const Text('申請受理'),
              content: HookBuilder(builder: (context) {
                final classList =
                    useProvider(teacherSchoolProvider).state!.schoolClassList;
                final classNameState = useState<String>(schoolClass.name);
                final school = useProvider(teacherSchoolProvider).state!;
                final schoolMap = useProvider(schoolMapProvider).state!;
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('教員名: ${teacher.name}'),
                  const Text('以下のクラスに変更します'),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        for (final schoolClass in classList)
                          ListTile(
                              title: Text(schoolClass.name),
                              leading: Radio<String>(
                                value: schoolClass.name,
                                groupValue: classNameState.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    classNameState.value = value;
                                  }
                                },
                              ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if (school.adminsId.contains(teacher.uid)) {
                            showAlertDialog(
                                context: context,
                                title: const Text('管理者教員は削除できません'),
                                content: const Text(''));
                          } else {
                            showAlertDialog(
                                context: context,
                                title: const Text('教員の削除'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('教員「${teacher.name}」を削除しますか？'),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('キャンセル'),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            deleteTeacherInSchool(
                                                teacher: teacher,
                                                schoolModel: school,
                                                schoolMap: schoolMap);
                                            Navigator.of(context)
                                              ..pop()
                                              ..pop();
                                          },
                                          child: const Text('削除'),
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          }
                        },
                        child: const Text('教員削除'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          editTeacherSchoolClass(
                              teacher: teacher,
                              nextClassName: classNameState.value,
                              currentClassName: schoolClass.name,
                              schoolModel: school,
                              schoolMap: schoolMap);
                        },
                        child: const Text('クラス変更'),
                      ),
                    ],
                  )
                ]);
              }));
        },
      ),
    );
  }
}

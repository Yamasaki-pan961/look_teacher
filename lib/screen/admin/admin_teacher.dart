import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/create_school_class.dart';
import 'package:look_teacher/common/push_page.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class AdminTeacherScreen extends HookWidget {
  const AdminTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final school = useProvider(teacherSchoolProvider).state;
    final schoolMap = useProvider(schoolMapProvider).state;
    if (school != null && schoolMap != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('教員の管理'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    showSimpleDialog(
                        context: context,
                        title: const Text('クラスの追加'),
                        content: HookBuilder(builder: (context) {
                          final inputState = useState('');
                          return Column(
                            children: [
                              TextFormField(
                                  onChanged: (value) {
                                    inputState.value = value;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Enter a new class name')),
                              Row(
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('キャンセル')),
                                  MaterialButton(
                                    onPressed: () {
                                      createSchoolClass(
                                          className: inputState.value,
                                          schoolModel: school,
                                          schoolMap: schoolMap);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('作成'),
                                  )
                                ],
                              )
                            ],
                          );
                        }));
                  },
                  child: const Text('クラスの追加'),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text('教員参加申請受理'),
                ),
                for (final schoolClass in school.schoolClassList)
                  ClassButton(schoolClass: schoolClass)
              ],
            ),
          ),
        ),
      );
    }
    return Container();
  }
}

class ClassButton extends HookWidget {
  const ClassButton({Key? key, required this.schoolClass}) : super(key: key);
  final SchoolClassModel schoolClass;

  @override
  Widget build(BuildContext context) {
    final editSchoolClassNameScreen = Container();
    final teacherListScreen = Container();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
            onPressed: () {
              pushPage(context, teacherListScreen);
            },
            child: Text(schoolClass.name)),
        MaterialButton(
            onPressed: () {
              pushPage(context, editSchoolClassNameScreen);
            },
            child: const Text('編集')),
      ],
    );
  }
}
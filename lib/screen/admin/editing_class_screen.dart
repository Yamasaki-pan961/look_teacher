import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/delete_school.dart';
import 'package:look_teacher/api/admin-school/delete_school_class.dart';
import 'package:look_teacher/api/admin-school/edit_school_class_name.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class EditingClassScreen extends HookWidget {
  const EditingClassScreen(
      {Key? key, required this.currentClass, required this.currentSchool})
      : super(key: key);
  final SchoolClassModel currentClass;
  final SchoolModel currentSchool;
  @override
  Widget build(BuildContext context) {
    final editingClassName = useState<String>('');
    return Scaffold(
      appBar: AppBar(
        title: const Text('クラス編集'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              obscureText: false,
              decoration: const InputDecoration(
                hintText: '新しいクラス名を入力',
              ),
              onChanged: (text) {
                editingClassName.value = text;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text('決定'),
                  onPressed: () {
                    final Map<String, String>? informationSchoolMap =
                        context.read(schoolMapProvider).state;
                    final SchoolModel? informationSchoolModel =
                        context.read(teacherSchoolProvider).state;
                    if (informationSchoolModel != null &&
                        informationSchoolMap != null) {
                      editSchoolClassName(
                          currentClass: currentClass,
                          newName: editingClassName.value,
                          schoolMap: informationSchoolMap,
                          schoolModel: informationSchoolModel);
                    }
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('クラスを削除'),
                  onPressed: () {
                    showAlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('この操作は取り消しできません。クラスは失われます。'),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                              ),
                              child: const Text('削除'),
                              onPressed: () {
                                final Map<String, String>?
                                    informationSchoolMap =
                                    context.read(schoolMapProvider).state;
                                if (informationSchoolMap != null) {
                                  deleteClass(
                                      schoolModel: currentSchool,
                                      schoolMap: informationSchoolMap,
                                      schoolClassModel: currentClass);
                                }
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('キャンセル'),
                            )
                          ],
                        ),
                        context: context,
                        title: const Text('クラスを削除しますか？'));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

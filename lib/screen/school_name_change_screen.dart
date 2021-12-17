import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/edit_school_name.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class SchoolNameChangeScreen extends HookWidget {
  const SchoolNameChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schoolMap = useProvider(schoolMapProvider).state;
    final teacherSchool = useProvider(teacherSchoolProvider).state;
    final inputState = useState<String>(teacherSchool!.schoolName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('学校名の変更'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextFormField(
            initialValue: teacherSchool.schoolName,
            decoration:
                const InputDecoration(hintText: 'Enter a new school name'),
          ),
          ElevatedButton(
              onPressed: () {
                editSchoolName(
                    schoolName: inputState.value,
                    schoolModel: teacherSchool,
                    schoolMap: schoolMap!);
                Navigator.of(context).pop();
              },
              child: const Text('変更'))
        ])),
      ),
    );
  }
}

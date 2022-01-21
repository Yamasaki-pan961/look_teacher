import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/school_class_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class SchoolClassListScreen extends HookWidget {
  const SchoolClassListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final school = useProvider(selectedSchoolProvider).state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('クラス一覧'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: SingleChildScrollView(child: Builder(builder: (context) {
              if (school != null) {
                final classList = school.schoolClassList;
                return Column(
                  children: classButtonList(classList),
                );
              } else {
                return const Text('クラスを作成してください');
              }
            })))));
  }

  List<Widget> classButtonList(List<SchoolClassModel> classList) {
    final list = <Widget>[];
    for (final schoolClass in classList) {
      list.add(Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(onPressed: () {}, child: Text(schoolClass.name)),
          ],
        ),
      ));
    }
    return list;
  }
}

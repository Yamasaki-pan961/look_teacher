import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/denial_teacher.dart';
import 'package:look_teacher/api/admin-school/permit_teacher.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class ApplicantListScreen extends HookWidget {
  const ApplicantListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final applicantList =
        useProvider(teacherSchoolProvider).state!.applicantList;
    return Scaffold(
        appBar: AppBar(
          title: const Text('参加申請一覧'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            for (final applicant in applicantList)
              ApplicantWidget(applicant: applicant)
          ],
        )));
  }
}

class ApplicantWidget extends StatelessWidget {
  const ApplicantWidget({Key? key, required this.applicant}) : super(key: key);
  final ApplicantModel applicant;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(applicant.teacherName),
        subtitle: Text(applicant.message),
        onTap: () {
          showAlertDialog(
              context: context,
              title: const Text('申請受理'),
              content: HookBuilder(builder: (context) {
                final classList =
                    useProvider(teacherSchoolProvider).state!.schoolClassList;
                final classNameState = useState<String>('default');
                final school = useProvider(teacherSchoolProvider).state!;
                final schoolMap = useProvider(schoolMapProvider).state!;
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('教員名: ${applicant.teacherName}'),
                  const Text('以下のクラスに追加します'),
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
                          denialTeacher(
                              applicantModel: applicant,
                              schoolModel: school,
                              schoolMap: schoolMap);
                          Navigator.of(context).pop();
                        },
                        child: const Text('申請拒否'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          permitTeacher(
                              applicantModel: applicant,
                              className: classNameState.value,
                              schoolModel: school,
                              schoolMap: schoolMap);
                          Navigator.of(context).pop();
                        },
                        child: const Text('クラスに追加'),
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

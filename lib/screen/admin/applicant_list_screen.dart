import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';

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
      ),
    );
  }
}

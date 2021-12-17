import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/models/applicant_model.dart';

class ApplicantListScreen extends HookWidget {
  const ApplicantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('参加申請一覧'),
        ),
        body: SingleChildScrollView(child: Column()));
  }
}

class ApplicantWidget extends StatelessWidget {
  const ApplicantWidget({Key? key, required this.applicant}) : super(key: key);
  final ApplicantModel applicant;
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: Text(''),),);
  }
}

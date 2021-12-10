import 'package:look_teacher/models/applicant_model.dart';
import 'package:look_teacher/models/school_model.dart';

Future<void> detailTeacher(ApplicantModel applicantModel,
    SchoolModel schoolModel, Map<String, dynamic> schoolMap) async {
  final applicantList = [...schoolModel.applicantList]..remove(applicantModel);
  
}

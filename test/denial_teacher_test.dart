import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/api/admin-school/denial_teacher.dart';

import 'dummy_data.dart';

Future<void> main() async {
  test('denial-test', () async{
   await  denialTeacher(
        applicantModel: applicant1,
        schoolMap: {},
        schoolModel: schoolModel,);
  });
}

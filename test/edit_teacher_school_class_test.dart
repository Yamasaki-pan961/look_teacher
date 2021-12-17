import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/api/admin-school/edit_teacher_school_class.dart';
import 'package:look_teacher/api/admin-school/permit_teacher.dart';

import 'dummy_data.dart';

Future<void> main() async {
  test('permit-test', () async {
    await editTeacherSchoolClass(
        teacher: teacher,
        className: 'class-A',
        schoolModel: schoolModel,
        schoolMap: {});
  });
}

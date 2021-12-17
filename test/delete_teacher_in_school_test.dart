import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/api/admin-school/delete_teacher_in_school.dart';
import 'dummy_data.dart';

Future<void> main() async {
  test('permit-test', () async {
    await deleteTeacherInSchool(
        teacher: teacher, schoolModel: schoolModel, schoolMap: {});
  });
}

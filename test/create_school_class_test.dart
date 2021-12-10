import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/api/admin-school/create_school_class.dart';
import 'package:look_teacher/api/admin-school/permit_teacher.dart';

import 'dummy_data.dart';

Future<void> main() async {
  test('permit-test', () async {
    await createSchoolClass(
        className: 'AA', schoolModel: schoolModel, schoolMap: {});
  });
}

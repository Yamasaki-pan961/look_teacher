import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/api/admin-school/edit_school_class_name.dart';

import 'dummy_data.dart';

Future<void> main() async {
  test('permit-test', () async {
    await editSchoolClassName(
        newName: 'ccc',
        currentClass: schoolClass,
        schoolModel: schoolModel,
        schoolMap: {});
  });
}

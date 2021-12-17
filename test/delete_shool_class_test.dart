import 'package:flutter_test/flutter_test.dart';
import 'package:look_teacher/api/admin-school/delete_school_class.dart';

import 'dummy_data.dart';

Future<void> main() async {
  test('delete_class', () async{
   await  deleteClass(
        schoolClassModel: schoolClass,
        schoolMap: {},
        schoolModel: schoolModel,
        );
  });
}

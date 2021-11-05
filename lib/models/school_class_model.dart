// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_class_model.freezed.dart';

@freezed
class SchoolAdminModel with _$SchoolAdminModel {
  const factory SchoolAdminModel(
      {@Default('') String name,
      @Default(<String>[]) List<String> teacherIdList,
      }) = _SchoolAdminModel;
}

// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_class_model.freezed.dart';

@freezed
class SchoolClassModel with _$SchoolClassModel {
  const factory SchoolClassModel(
      {@Default('') String name,
      @Default(<String>[]) List<String> teacherIdList,
      }) = _SchoolClassModel;
        Map<String, dynamic> toMap() {
    return <String, dynamic>{'name':name,'teacherIdList':teacherIdList};
  }
}

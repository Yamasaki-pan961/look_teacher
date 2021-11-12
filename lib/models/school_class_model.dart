// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_class_model.freezed.dart';

@freezed
class SchoolClassModel with _$SchoolClassModel {
  const factory SchoolClassModel({
    @Default('') String name,
    @Default(<String>[]) List<String> teacherIdList,
  }) = _SchoolClassModel;

  factory SchoolClassModel.fromMap(Map<String, dynamic> map) {
    final String name = map['name'] as String;
    final List<String> teacherIdList = map['teacherIdList'] as List<String>;
    return SchoolClassModel(name: name, teacherIdList: teacherIdList);
  }

  const SchoolClassModel._();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'teacherIdList': teacherIdList};
  }
}

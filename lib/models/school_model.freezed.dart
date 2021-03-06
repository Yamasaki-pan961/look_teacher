// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'school_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SchoolModelTearOff {
  const _$SchoolModelTearOff();

  _SchoolModel call(
      {String schoolName = '',
      String schoolId = '',
      List<String> adminsId = const <String>[],
      List<DeviceModel> deviceList = const <DeviceModel>[],
      List<ApplicantModel> applicantList = const <ApplicantModel>[],
      List<SchoolClassModel> schoolClassList = const <SchoolClassModel>[]}) {
    return _SchoolModel(
      schoolName: schoolName,
      schoolId: schoolId,
      adminsId: adminsId,
      deviceList: deviceList,
      applicantList: applicantList,
      schoolClassList: schoolClassList,
    );
  }
}

/// @nodoc
const $SchoolModel = _$SchoolModelTearOff();

/// @nodoc
mixin _$SchoolModel {
  String get schoolName => throw _privateConstructorUsedError;
  String get schoolId => throw _privateConstructorUsedError;
  List<String> get adminsId => throw _privateConstructorUsedError;
  List<DeviceModel> get deviceList => throw _privateConstructorUsedError;
  List<ApplicantModel> get applicantList => throw _privateConstructorUsedError;
  List<SchoolClassModel> get schoolClassList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchoolModelCopyWith<SchoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolModelCopyWith<$Res> {
  factory $SchoolModelCopyWith(
          SchoolModel value, $Res Function(SchoolModel) then) =
      _$SchoolModelCopyWithImpl<$Res>;
  $Res call(
      {String schoolName,
      String schoolId,
      List<String> adminsId,
      List<DeviceModel> deviceList,
      List<ApplicantModel> applicantList,
      List<SchoolClassModel> schoolClassList});
}

/// @nodoc
class _$SchoolModelCopyWithImpl<$Res> implements $SchoolModelCopyWith<$Res> {
  _$SchoolModelCopyWithImpl(this._value, this._then);

  final SchoolModel _value;
  // ignore: unused_field
  final $Res Function(SchoolModel) _then;

  @override
  $Res call({
    Object? schoolName = freezed,
    Object? schoolId = freezed,
    Object? adminsId = freezed,
    Object? deviceList = freezed,
    Object? applicantList = freezed,
    Object? schoolClassList = freezed,
  }) {
    return _then(_value.copyWith(
      schoolName: schoolName == freezed
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: schoolId == freezed
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      adminsId: adminsId == freezed
          ? _value.adminsId
          : adminsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deviceList: deviceList == freezed
          ? _value.deviceList
          : deviceList // ignore: cast_nullable_to_non_nullable
              as List<DeviceModel>,
      applicantList: applicantList == freezed
          ? _value.applicantList
          : applicantList // ignore: cast_nullable_to_non_nullable
              as List<ApplicantModel>,
      schoolClassList: schoolClassList == freezed
          ? _value.schoolClassList
          : schoolClassList // ignore: cast_nullable_to_non_nullable
              as List<SchoolClassModel>,
    ));
  }
}

/// @nodoc
abstract class _$SchoolModelCopyWith<$Res>
    implements $SchoolModelCopyWith<$Res> {
  factory _$SchoolModelCopyWith(
          _SchoolModel value, $Res Function(_SchoolModel) then) =
      __$SchoolModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String schoolName,
      String schoolId,
      List<String> adminsId,
      List<DeviceModel> deviceList,
      List<ApplicantModel> applicantList,
      List<SchoolClassModel> schoolClassList});
}

/// @nodoc
class __$SchoolModelCopyWithImpl<$Res> extends _$SchoolModelCopyWithImpl<$Res>
    implements _$SchoolModelCopyWith<$Res> {
  __$SchoolModelCopyWithImpl(
      _SchoolModel _value, $Res Function(_SchoolModel) _then)
      : super(_value, (v) => _then(v as _SchoolModel));

  @override
  _SchoolModel get _value => super._value as _SchoolModel;

  @override
  $Res call({
    Object? schoolName = freezed,
    Object? schoolId = freezed,
    Object? adminsId = freezed,
    Object? deviceList = freezed,
    Object? applicantList = freezed,
    Object? schoolClassList = freezed,
  }) {
    return _then(_SchoolModel(
      schoolName: schoolName == freezed
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: schoolId == freezed
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      adminsId: adminsId == freezed
          ? _value.adminsId
          : adminsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deviceList: deviceList == freezed
          ? _value.deviceList
          : deviceList // ignore: cast_nullable_to_non_nullable
              as List<DeviceModel>,
      applicantList: applicantList == freezed
          ? _value.applicantList
          : applicantList // ignore: cast_nullable_to_non_nullable
              as List<ApplicantModel>,
      schoolClassList: schoolClassList == freezed
          ? _value.schoolClassList
          : schoolClassList // ignore: cast_nullable_to_non_nullable
              as List<SchoolClassModel>,
    ));
  }
}

/// @nodoc

class _$_SchoolModel extends _SchoolModel {
  const _$_SchoolModel(
      {this.schoolName = '',
      this.schoolId = '',
      this.adminsId = const <String>[],
      this.deviceList = const <DeviceModel>[],
      this.applicantList = const <ApplicantModel>[],
      this.schoolClassList = const <SchoolClassModel>[]})
      : super._();

  @JsonKey(defaultValue: '')
  @override
  final String schoolName;
  @JsonKey(defaultValue: '')
  @override
  final String schoolId;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> adminsId;
  @JsonKey(defaultValue: const <DeviceModel>[])
  @override
  final List<DeviceModel> deviceList;
  @JsonKey(defaultValue: const <ApplicantModel>[])
  @override
  final List<ApplicantModel> applicantList;
  @JsonKey(defaultValue: const <SchoolClassModel>[])
  @override
  final List<SchoolClassModel> schoolClassList;

  @override
  String toString() {
    return 'SchoolModel(schoolName: $schoolName, schoolId: $schoolId, adminsId: $adminsId, deviceList: $deviceList, applicantList: $applicantList, schoolClassList: $schoolClassList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SchoolModel &&
            (identical(other.schoolName, schoolName) ||
                const DeepCollectionEquality()
                    .equals(other.schoolName, schoolName)) &&
            (identical(other.schoolId, schoolId) ||
                const DeepCollectionEquality()
                    .equals(other.schoolId, schoolId)) &&
            (identical(other.adminsId, adminsId) ||
                const DeepCollectionEquality()
                    .equals(other.adminsId, adminsId)) &&
            (identical(other.deviceList, deviceList) ||
                const DeepCollectionEquality()
                    .equals(other.deviceList, deviceList)) &&
            (identical(other.applicantList, applicantList) ||
                const DeepCollectionEquality()
                    .equals(other.applicantList, applicantList)) &&
            (identical(other.schoolClassList, schoolClassList) ||
                const DeepCollectionEquality()
                    .equals(other.schoolClassList, schoolClassList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(schoolName) ^
      const DeepCollectionEquality().hash(schoolId) ^
      const DeepCollectionEquality().hash(adminsId) ^
      const DeepCollectionEquality().hash(deviceList) ^
      const DeepCollectionEquality().hash(applicantList) ^
      const DeepCollectionEquality().hash(schoolClassList);

  @JsonKey(ignore: true)
  @override
  _$SchoolModelCopyWith<_SchoolModel> get copyWith =>
      __$SchoolModelCopyWithImpl<_SchoolModel>(this, _$identity);
}

abstract class _SchoolModel extends SchoolModel {
  const factory _SchoolModel(
      {String schoolName,
      String schoolId,
      List<String> adminsId,
      List<DeviceModel> deviceList,
      List<ApplicantModel> applicantList,
      List<SchoolClassModel> schoolClassList}) = _$_SchoolModel;
  const _SchoolModel._() : super._();

  @override
  String get schoolName => throw _privateConstructorUsedError;
  @override
  String get schoolId => throw _privateConstructorUsedError;
  @override
  List<String> get adminsId => throw _privateConstructorUsedError;
  @override
  List<DeviceModel> get deviceList => throw _privateConstructorUsedError;
  @override
  List<ApplicantModel> get applicantList => throw _privateConstructorUsedError;
  @override
  List<SchoolClassModel> get schoolClassList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SchoolModelCopyWith<_SchoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

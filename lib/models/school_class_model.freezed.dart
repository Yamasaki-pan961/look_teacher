// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'school_class_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SchoolAdminModelTearOff {
  const _$SchoolAdminModelTearOff();

  _SchoolAdminModel call(
      {String name = '', List<String> teacherIdList = const <String>[]}) {
    return _SchoolAdminModel(
      name: name,
      teacherIdList: teacherIdList,
    );
  }
}

/// @nodoc
const $SchoolAdminModel = _$SchoolAdminModelTearOff();

/// @nodoc
mixin _$SchoolAdminModel {
  String get name => throw _privateConstructorUsedError;
  List<String> get teacherIdList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchoolAdminModelCopyWith<SchoolAdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolAdminModelCopyWith<$Res> {
  factory $SchoolAdminModelCopyWith(
          SchoolAdminModel value, $Res Function(SchoolAdminModel) then) =
      _$SchoolAdminModelCopyWithImpl<$Res>;
  $Res call({String name, List<String> teacherIdList});
}

/// @nodoc
class _$SchoolAdminModelCopyWithImpl<$Res>
    implements $SchoolAdminModelCopyWith<$Res> {
  _$SchoolAdminModelCopyWithImpl(this._value, this._then);

  final SchoolAdminModel _value;
  // ignore: unused_field
  final $Res Function(SchoolAdminModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? teacherIdList = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      teacherIdList: teacherIdList == freezed
          ? _value.teacherIdList
          : teacherIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SchoolAdminModelCopyWith<$Res>
    implements $SchoolAdminModelCopyWith<$Res> {
  factory _$SchoolAdminModelCopyWith(
          _SchoolAdminModel value, $Res Function(_SchoolAdminModel) then) =
      __$SchoolAdminModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<String> teacherIdList});
}

/// @nodoc
class __$SchoolAdminModelCopyWithImpl<$Res>
    extends _$SchoolAdminModelCopyWithImpl<$Res>
    implements _$SchoolAdminModelCopyWith<$Res> {
  __$SchoolAdminModelCopyWithImpl(
      _SchoolAdminModel _value, $Res Function(_SchoolAdminModel) _then)
      : super(_value, (v) => _then(v as _SchoolAdminModel));

  @override
  _SchoolAdminModel get _value => super._value as _SchoolAdminModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? teacherIdList = freezed,
  }) {
    return _then(_SchoolAdminModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      teacherIdList: teacherIdList == freezed
          ? _value.teacherIdList
          : teacherIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SchoolAdminModel implements _SchoolAdminModel {
  const _$_SchoolAdminModel(
      {this.name = '', this.teacherIdList = const <String>[]});

  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> teacherIdList;

  @override
  String toString() {
    return 'SchoolAdminModel(name: $name, teacherIdList: $teacherIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SchoolAdminModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.teacherIdList, teacherIdList) ||
                const DeepCollectionEquality()
                    .equals(other.teacherIdList, teacherIdList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(teacherIdList);

  @JsonKey(ignore: true)
  @override
  _$SchoolAdminModelCopyWith<_SchoolAdminModel> get copyWith =>
      __$SchoolAdminModelCopyWithImpl<_SchoolAdminModel>(this, _$identity);
}

abstract class _SchoolAdminModel implements SchoolAdminModel {
  const factory _SchoolAdminModel({String name, List<String> teacherIdList}) =
      _$_SchoolAdminModel;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get teacherIdList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SchoolAdminModelCopyWith<_SchoolAdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

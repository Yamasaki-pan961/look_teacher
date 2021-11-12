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
class _$SchoolClassModelTearOff {
  const _$SchoolClassModelTearOff();

  _SchoolClassModel call(
      {String name = '', List<String> teacherIdList = const <String>[]}) {
    return _SchoolClassModel(
      name: name,
      teacherIdList: teacherIdList,
    );
  }
}

/// @nodoc
const $SchoolClassModel = _$SchoolClassModelTearOff();

/// @nodoc
mixin _$SchoolClassModel {
  String get name => throw _privateConstructorUsedError;
  List<String> get teacherIdList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchoolClassModelCopyWith<SchoolClassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolClassModelCopyWith<$Res> {
  factory $SchoolClassModelCopyWith(
          SchoolClassModel value, $Res Function(SchoolClassModel) then) =
      _$SchoolClassModelCopyWithImpl<$Res>;
  $Res call({String name, List<String> teacherIdList});
}

/// @nodoc
class _$SchoolClassModelCopyWithImpl<$Res>
    implements $SchoolClassModelCopyWith<$Res> {
  _$SchoolClassModelCopyWithImpl(this._value, this._then);

  final SchoolClassModel _value;
  // ignore: unused_field
  final $Res Function(SchoolClassModel) _then;

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
abstract class _$SchoolClassModelCopyWith<$Res>
    implements $SchoolClassModelCopyWith<$Res> {
  factory _$SchoolClassModelCopyWith(
          _SchoolClassModel value, $Res Function(_SchoolClassModel) then) =
      __$SchoolClassModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<String> teacherIdList});
}

/// @nodoc
class __$SchoolClassModelCopyWithImpl<$Res>
    extends _$SchoolClassModelCopyWithImpl<$Res>
    implements _$SchoolClassModelCopyWith<$Res> {
  __$SchoolClassModelCopyWithImpl(
      _SchoolClassModel _value, $Res Function(_SchoolClassModel) _then)
      : super(_value, (v) => _then(v as _SchoolClassModel));

  @override
  _SchoolClassModel get _value => super._value as _SchoolClassModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? teacherIdList = freezed,
  }) {
    return _then(_SchoolClassModel(
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

class _$_SchoolClassModel extends _SchoolClassModel {
  const _$_SchoolClassModel(
      {this.name = '', this.teacherIdList = const <String>[]})
      : super._();

  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> teacherIdList;

  @override
  String toString() {
    return 'SchoolClassModel(name: $name, teacherIdList: $teacherIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SchoolClassModel &&
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
  _$SchoolClassModelCopyWith<_SchoolClassModel> get copyWith =>
      __$SchoolClassModelCopyWithImpl<_SchoolClassModel>(this, _$identity);
}

abstract class _SchoolClassModel extends SchoolClassModel {
  const factory _SchoolClassModel({String name, List<String> teacherIdList}) =
      _$_SchoolClassModel;
  const _SchoolClassModel._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get teacherIdList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SchoolClassModelCopyWith<_SchoolClassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

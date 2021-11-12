// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'applicant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApplicantModelTearOff {
  const _$ApplicantModelTearOff();

  _ApplicantModel call({String teacherId = '', String message = ''}) {
    return _ApplicantModel(
      teacherId: teacherId,
      message: message,
    );
  }
}

/// @nodoc
const $ApplicantModel = _$ApplicantModelTearOff();

/// @nodoc
mixin _$ApplicantModel {
  String get teacherId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicantModelCopyWith<ApplicantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicantModelCopyWith<$Res> {
  factory $ApplicantModelCopyWith(
          ApplicantModel value, $Res Function(ApplicantModel) then) =
      _$ApplicantModelCopyWithImpl<$Res>;
  $Res call({String teacherId, String message});
}

/// @nodoc
class _$ApplicantModelCopyWithImpl<$Res>
    implements $ApplicantModelCopyWith<$Res> {
  _$ApplicantModelCopyWithImpl(this._value, this._then);

  final ApplicantModel _value;
  // ignore: unused_field
  final $Res Function(ApplicantModel) _then;

  @override
  $Res call({
    Object? teacherId = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      teacherId: teacherId == freezed
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApplicantModelCopyWith<$Res>
    implements $ApplicantModelCopyWith<$Res> {
  factory _$ApplicantModelCopyWith(
          _ApplicantModel value, $Res Function(_ApplicantModel) then) =
      __$ApplicantModelCopyWithImpl<$Res>;
  @override
  $Res call({String teacherId, String message});
}

/// @nodoc
class __$ApplicantModelCopyWithImpl<$Res>
    extends _$ApplicantModelCopyWithImpl<$Res>
    implements _$ApplicantModelCopyWith<$Res> {
  __$ApplicantModelCopyWithImpl(
      _ApplicantModel _value, $Res Function(_ApplicantModel) _then)
      : super(_value, (v) => _then(v as _ApplicantModel));

  @override
  _ApplicantModel get _value => super._value as _ApplicantModel;

  @override
  $Res call({
    Object? teacherId = freezed,
    Object? message = freezed,
  }) {
    return _then(_ApplicantModel(
      teacherId: teacherId == freezed
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ApplicantModel extends _ApplicantModel {
  const _$_ApplicantModel({this.teacherId = '', this.message = ''}) : super._();

  @JsonKey(defaultValue: '')
  @override
  final String teacherId;
  @JsonKey(defaultValue: '')
  @override
  final String message;

  @override
  String toString() {
    return 'ApplicantModel(teacherId: $teacherId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApplicantModel &&
            (identical(other.teacherId, teacherId) ||
                const DeepCollectionEquality()
                    .equals(other.teacherId, teacherId)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(teacherId) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ApplicantModelCopyWith<_ApplicantModel> get copyWith =>
      __$ApplicantModelCopyWithImpl<_ApplicantModel>(this, _$identity);
}

abstract class _ApplicantModel extends ApplicantModel {
  const factory _ApplicantModel({String teacherId, String message}) =
      _$_ApplicantModel;
  const _ApplicantModel._() : super._();

  @override
  String get teacherId => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicantModelCopyWith<_ApplicantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

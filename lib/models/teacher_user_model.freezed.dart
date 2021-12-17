// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'teacher_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TeacherUserModelTearOff {
  const _$TeacherUserModelTearOff();

  _TeacherUserModel call(
      {required String uid,
      String name = '',
      bool isEnableBluetooth = true,
      String deviceId = '',
      String schoolId = '',
      required DateTime lastScanTime,
      List<String> notifications = const <String>[]}) {
    return _TeacherUserModel(
      uid: uid,
      name: name,
      isEnableBluetooth: isEnableBluetooth,
      deviceId: deviceId,
      schoolId: schoolId,
      lastScanTime: lastScanTime,
      notifications: notifications,
    );
  }
}

/// @nodoc
const $TeacherUserModel = _$TeacherUserModelTearOff();

/// @nodoc
mixin _$TeacherUserModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isEnableBluetooth => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get schoolId => throw _privateConstructorUsedError;
  DateTime get lastScanTime => throw _privateConstructorUsedError;
  List<String> get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherUserModelCopyWith<TeacherUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherUserModelCopyWith<$Res> {
  factory $TeacherUserModelCopyWith(
          TeacherUserModel value, $Res Function(TeacherUserModel) then) =
      _$TeacherUserModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      bool isEnableBluetooth,
      String deviceId,
      String schoolId,
      DateTime lastScanTime,
      List<String> notifications});
}

/// @nodoc
class _$TeacherUserModelCopyWithImpl<$Res>
    implements $TeacherUserModelCopyWith<$Res> {
  _$TeacherUserModelCopyWithImpl(this._value, this._then);

  final TeacherUserModel _value;
  // ignore: unused_field
  final $Res Function(TeacherUserModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? isEnableBluetooth = freezed,
    Object? deviceId = freezed,
    Object? schoolId = freezed,
    Object? lastScanTime = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isEnableBluetooth: isEnableBluetooth == freezed
          ? _value.isEnableBluetooth
          : isEnableBluetooth // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: schoolId == freezed
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      lastScanTime: lastScanTime == freezed
          ? _value.lastScanTime
          : lastScanTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$TeacherUserModelCopyWith<$Res>
    implements $TeacherUserModelCopyWith<$Res> {
  factory _$TeacherUserModelCopyWith(
          _TeacherUserModel value, $Res Function(_TeacherUserModel) then) =
      __$TeacherUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      bool isEnableBluetooth,
      String deviceId,
      String schoolId,
      DateTime lastScanTime,
      List<String> notifications});
}

/// @nodoc
class __$TeacherUserModelCopyWithImpl<$Res>
    extends _$TeacherUserModelCopyWithImpl<$Res>
    implements _$TeacherUserModelCopyWith<$Res> {
  __$TeacherUserModelCopyWithImpl(
      _TeacherUserModel _value, $Res Function(_TeacherUserModel) _then)
      : super(_value, (v) => _then(v as _TeacherUserModel));

  @override
  _TeacherUserModel get _value => super._value as _TeacherUserModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? isEnableBluetooth = freezed,
    Object? deviceId = freezed,
    Object? schoolId = freezed,
    Object? lastScanTime = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_TeacherUserModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isEnableBluetooth: isEnableBluetooth == freezed
          ? _value.isEnableBluetooth
          : isEnableBluetooth // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: schoolId == freezed
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      lastScanTime: lastScanTime == freezed
          ? _value.lastScanTime
          : lastScanTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_TeacherUserModel extends _TeacherUserModel {
  const _$_TeacherUserModel(
      {required this.uid,
      this.name = '',
      this.isEnableBluetooth = true,
      this.deviceId = '',
      this.schoolId = '',
      required this.lastScanTime,
      this.notifications = const <String>[]})
      : super._();

  @override
  final String uid;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: true)
  @override
  final bool isEnableBluetooth;
  @JsonKey(defaultValue: '')
  @override
  final String deviceId;
  @JsonKey(defaultValue: '')
  @override
  final String schoolId;
  @override
  final DateTime lastScanTime;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> notifications;

  @override
  String toString() {
    return 'TeacherUserModel(uid: $uid, name: $name, isEnableBluetooth: $isEnableBluetooth, deviceId: $deviceId, schoolId: $schoolId, lastScanTime: $lastScanTime, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeacherUserModel &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isEnableBluetooth, isEnableBluetooth) ||
                const DeepCollectionEquality()
                    .equals(other.isEnableBluetooth, isEnableBluetooth)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.schoolId, schoolId) ||
                const DeepCollectionEquality()
                    .equals(other.schoolId, schoolId)) &&
            (identical(other.lastScanTime, lastScanTime) ||
                const DeepCollectionEquality()
                    .equals(other.lastScanTime, lastScanTime)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isEnableBluetooth) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(schoolId) ^
      const DeepCollectionEquality().hash(lastScanTime) ^
      const DeepCollectionEquality().hash(notifications);

  @JsonKey(ignore: true)
  @override
  _$TeacherUserModelCopyWith<_TeacherUserModel> get copyWith =>
      __$TeacherUserModelCopyWithImpl<_TeacherUserModel>(this, _$identity);
}

abstract class _TeacherUserModel extends TeacherUserModel {
  const factory _TeacherUserModel(
      {required String uid,
      String name,
      bool isEnableBluetooth,
      String deviceId,
      String schoolId,
      required DateTime lastScanTime,
      List<String> notifications}) = _$_TeacherUserModel;
  const _TeacherUserModel._() : super._();

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get isEnableBluetooth => throw _privateConstructorUsedError;
  @override
  String get deviceId => throw _privateConstructorUsedError;
  @override
  String get schoolId => throw _privateConstructorUsedError;
  @override
  DateTime get lastScanTime => throw _privateConstructorUsedError;
  @override
  List<String> get notifications => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TeacherUserModelCopyWith<_TeacherUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

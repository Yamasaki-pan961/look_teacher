// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {required String uid,
      String name = '',
      bool isEnableBluetooth = true,
      String deviceId = '',
      String schoolId = '',
      bool isAdmin = false,
      List<String> notifications = const <String>[]}) {
    return _UserModel(
      uid: uid,
      name: name,
      isEnableBluetooth: isEnableBluetooth,
      deviceId: deviceId,
      schoolId: schoolId,
      isAdmin: isAdmin,
      notifications: notifications,
    );
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isEnableBluetooth => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get schoolId => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  List<String> get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      bool isEnableBluetooth,
      String deviceId,
      String schoolId,
      bool isAdmin,
      List<String> notifications});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? isEnableBluetooth = freezed,
    Object? deviceId = freezed,
    Object? schoolId = freezed,
    Object? isAdmin = freezed,
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
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      bool isEnableBluetooth,
      String deviceId,
      String schoolId,
      bool isAdmin,
      List<String> notifications});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? isEnableBluetooth = freezed,
    Object? deviceId = freezed,
    Object? schoolId = freezed,
    Object? isAdmin = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_UserModel(
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
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.uid,
      this.name = '',
      this.isEnableBluetooth = true,
      this.deviceId = '',
      this.schoolId = '',
      this.isAdmin = false,
      this.notifications = const <String>[]});

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
  @JsonKey(defaultValue: false)
  @override
  final bool isAdmin;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> notifications;

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, isEnableBluetooth: $isEnableBluetooth, deviceId: $deviceId, schoolId: $schoolId, isAdmin: $isAdmin, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
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
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.isAdmin, isAdmin)) &&
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
      const DeepCollectionEquality().hash(isAdmin) ^
      const DeepCollectionEquality().hash(notifications);

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required String uid,
      String name,
      bool isEnableBluetooth,
      String deviceId,
      String schoolId,
      bool isAdmin,
      List<String> notifications}) = _$_UserModel;

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
  bool get isAdmin => throw _privateConstructorUsedError;
  @override
  List<String> get notifications => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

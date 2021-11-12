// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceModelTearOff {
  const _$DeviceModelTearOff();

  _DeviceModel call(
      {String deviceName = 'deviceName',
      String deviceId = 'deviceId',
      String locationName = 'locationName'}) {
    return _DeviceModel(
      deviceName: deviceName,
      deviceId: deviceId,
      locationName: locationName,
    );
  }
}

/// @nodoc
const $DeviceModel = _$DeviceModelTearOff();

/// @nodoc
mixin _$DeviceModel {
  String get deviceName => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceModelCopyWith<DeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) then) =
      _$DeviceModelCopyWithImpl<$Res>;
  $Res call({String deviceName, String deviceId, String locationName});
}

/// @nodoc
class _$DeviceModelCopyWithImpl<$Res> implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._value, this._then);

  final DeviceModel _value;
  // ignore: unused_field
  final $Res Function(DeviceModel) _then;

  @override
  $Res call({
    Object? deviceName = freezed,
    Object? deviceId = freezed,
    Object? locationName = freezed,
  }) {
    return _then(_value.copyWith(
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DeviceModelCopyWith<$Res>
    implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(
          _DeviceModel value, $Res Function(_DeviceModel) then) =
      __$DeviceModelCopyWithImpl<$Res>;
  @override
  $Res call({String deviceName, String deviceId, String locationName});
}

/// @nodoc
class __$DeviceModelCopyWithImpl<$Res> extends _$DeviceModelCopyWithImpl<$Res>
    implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(
      _DeviceModel _value, $Res Function(_DeviceModel) _then)
      : super(_value, (v) => _then(v as _DeviceModel));

  @override
  _DeviceModel get _value => super._value as _DeviceModel;

  @override
  $Res call({
    Object? deviceName = freezed,
    Object? deviceId = freezed,
    Object? locationName = freezed,
  }) {
    return _then(_DeviceModel(
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceModel extends _DeviceModel {
  const _$_DeviceModel(
      {this.deviceName = 'deviceName',
      this.deviceId = 'deviceId',
      this.locationName = 'locationName'})
      : super._();

  @JsonKey(defaultValue: 'deviceName')
  @override
  final String deviceName;
  @JsonKey(defaultValue: 'deviceId')
  @override
  final String deviceId;
  @JsonKey(defaultValue: 'locationName')
  @override
  final String locationName;

  @override
  String toString() {
    return 'DeviceModel(deviceName: $deviceName, deviceId: $deviceId, locationName: $locationName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeviceModel &&
            (identical(other.deviceName, deviceName) ||
                const DeepCollectionEquality()
                    .equals(other.deviceName, deviceName)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.locationName, locationName) ||
                const DeepCollectionEquality()
                    .equals(other.locationName, locationName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deviceName) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(locationName);

  @JsonKey(ignore: true)
  @override
  _$DeviceModelCopyWith<_DeviceModel> get copyWith =>
      __$DeviceModelCopyWithImpl<_DeviceModel>(this, _$identity);
}

abstract class _DeviceModel extends DeviceModel {
  const factory _DeviceModel(
      {String deviceName,
      String deviceId,
      String locationName}) = _$_DeviceModel;
  const _DeviceModel._() : super._();

  @override
  String get deviceName => throw _privateConstructorUsedError;
  @override
  String get deviceId => throw _privateConstructorUsedError;
  @override
  String get locationName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeviceModelCopyWith<_DeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

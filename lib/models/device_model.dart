// flutter pub run build_runner build --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';

@freezed
class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    @Default('deviceName') String deviceName,
    @Default('deviceId') String deviceId,
    @Default('locationName') String locationName,
  }) = _DeviceModel;

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    final String deviceName = map['deviceName'] as String;
    final String deviceId = map['deviceId'] as String;
    final String locationName = map['locationName'] as String;

    return DeviceModel(
      deviceName: deviceName,
      deviceId: deviceId,
      locationName: locationName
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviceName': deviceName,
      'deviceId': deviceId,
      'locationName': locationName
    };
  }
}

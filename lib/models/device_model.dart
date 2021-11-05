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
}

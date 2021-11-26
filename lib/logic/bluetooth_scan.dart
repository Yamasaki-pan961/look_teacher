import 'dart:developer';

import 'package:flutter_blue/flutter_blue.dart';

Future<Map<BluetoothDevice, int>?> bluetoothScan() async {
  final deviceMap = <BluetoothDevice, int>{};
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  if (!await flutterBlue.isScanning.first) {
    log('start scan');
    await flutterBlue.startScan(timeout: const Duration(seconds: 4));

    flutterBlue.scanResults.listen((scanList) {
      for (final result in scanList) {
        if (result.device.name != '') {
          deviceMap.addEntries({MapEntry(result.device, result.rssi)});
        }
      }
    });
// Stop scanning
    await flutterBlue.stopScan();
    log('stop scan');
    log(deviceMap.toString());
    return deviceMap;
  } else {
    log('scanning another. Did not scan');
  }
}

Future<String?> getNearestDeviceId(List<String> filterIdList) async {
  final Map<BluetoothDevice, int>? deviceMap = await bluetoothScan();
  if (deviceMap != null) {
    deviceMap.removeWhere((device, rssi) {
      return !filterIdList.contains(device.id.toString());
    });
    log('filtered device');
    log(deviceMap.toString());
    if (deviceMap.isNotEmpty) {
      String nearestDeviceId = deviceMap.keys.first.id.toString();
      int nearestRssi = -100;
      deviceMap.forEach((device, rssi) {
        if (nearestRssi <= rssi) {
          nearestRssi = rssi;
          nearestDeviceId = device.id.toString();
        }
      });
      return nearestDeviceId;
    }
  }
}

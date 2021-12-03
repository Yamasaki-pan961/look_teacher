import 'dart:developer';

import 'package:flutter_blue/flutter_blue.dart';

Future<Map<BluetoothDevice, int>?> bluetoothScan() async {
  final deviceMap = <BluetoothDevice, int>{};
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  // 現在スキャン中かチェック
  if (await flutterBlue.isScanning.first) {
    await flutterBlue.stopScan();
  }
  log('start scan');
  await flutterBlue.startScan(timeout: const Duration(seconds: 4));

  // スキャン結果を使う
  flutterBlue.scanResults.listen((scanList) {
    for (final result in scanList) {
      // 名前のあるものだけdeviceMapに追加する
      if (result.device.name != '') {
        deviceMap.addEntries({MapEntry(result.device, result.rssi)});
      }
    }
  });
  await flutterBlue.stopScan();
  log('stop scan');

  // スキャンが成功したとき deviceMapを返却する
  return deviceMap;
}

// 最も近くにあるdeviceを取得する
Future<String?> getNearestDeviceId(List<String> filterIdList) async {
  // スキャン結果を取得する
  final Map<BluetoothDevice, int>? deviceMap = await bluetoothScan();

  // スキャンが成功しているとき。成功しているときはdeviceMapがnullでない
  if (deviceMap != null) {
    //filterIdList(school.deviceListのdeviceId)に含まれないdeviceを削除する
    deviceMap.removeWhere((device, rssi) {
      return !filterIdList.contains(device.id.toString());
    });

    log('filtered device');
    log(deviceMap.toString());

    // deviceMapが空出ないとき
    if (deviceMap.isNotEmpty) {
      // 最も近いデバイスを保持する変数の作成
      // deviceMapの最初のdeviceのidを初期値とする
      String nearestDeviceId = deviceMap.keys.first.id.toString();

      // rssi（電波強度）の最弱値=-100を初期値とする
      int nearestRssi = -100;

      // deviceMapすべての要素を引き出し、処理を行う
      deviceMap.forEach((device, rssi) {
        // 最も近いデバイスとdeviceMapの要素のどっちが電波強度が強いか比較
        if (nearestRssi <= rssi) {
          // 要素のほうが強いとき、その要素を最も近いデバイスとする
          nearestRssi = rssi;
          nearestDeviceId = device.id.toString();
        }
      });
      return nearestDeviceId;
    }
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothTryoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: _logBluetooth,
        child: Text('Scan on Bluetooth'),
      ),
    );
  }

  Future<void> _logBluetooth() async {
    final FlutterBlue flutterBlue = FlutterBlue.instance;

    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        log('name:${device.name}');
      }
    });
// Start scanning
    await flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) async {
      // do something with scan results
      results.where((element) => element.advertisementData.connectable).toSet().toList();
      results.forEach((element) {
        log('name: ${element.advertisementData.localName}, ${element.advertisementData.serviceUuids}, ${element.device.id}');
      });
    });

// Stop scanning
    await flutterBlue.stopScan();
  }
}

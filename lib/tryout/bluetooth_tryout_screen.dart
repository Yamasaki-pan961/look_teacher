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

    
    // Start scanning
    await flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print(
            '${r.device.name} found! rssi: ${r.rssi} deviceId ${r.device.id}');
      }
    });

// Stop scanning
    await flutterBlue.stopScan();
  }
}
